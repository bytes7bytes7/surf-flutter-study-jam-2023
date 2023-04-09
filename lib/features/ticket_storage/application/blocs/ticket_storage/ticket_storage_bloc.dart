import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../providers/ticket_storage_provider.dart';
import '../../view_models/view_models.dart';

part 'ticket_storage_event.dart';

part 'ticket_storage_state.dart';

const _formatSymbol = '%';

const _waitsForLoadingDesc = 'Ожидает начала загрузки';
const _isLoadingDesc = 'Загружается $_formatSymbol из $_formatSymbol';
const _loadedDesc = 'Файл загружен';

@injectable
class TicketStorageBloc extends Bloc<TicketStorageEvent, TicketStorageState> {
  TicketStorageBloc(
    this._ticketStorageProvider,
  ) : super(const TicketStorageState()) {
    on<AddTickerUrlEvent>(_addTicketUrl);
    on<ChangeScrollPosEvent>(_changeScrollPos);
    on<DownloadTicketEvent>(_downloadTicket);
    on<PauseDownloadTicketEvent>(_pauseDownloadTicket);
    on<UpdateLoadingProgressEvent>(_updateLoadingProgress);
  }

  final TicketStorageProvider _ticketStorageProvider;

  Future<void> _addTicketUrl(
    AddTickerUrlEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    final filename = event.url.substring(event.url.lastIndexOf('/') + 1);

    late TicketID id;
    do {
      id = TicketID.generate();
    } while (state.tickets.firstWhereOrNull((e) => e.id == id.str) != null);

    emit(
      state.copyWith(
        newTicketIsAdded: true,
        tickets: List.from(state.tickets)
          ..add(
            TicketVM(
              id: id.str,
              name: filename,
              url: event.url,
              loadingState: const TicketWaitsForLoadingState(
                desc: _waitsForLoadingDesc,
              ),
            ),
          ),
      ),
    );
  }

  Future<void> _changeScrollPos(
    ChangeScrollPosEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    if (event.maxPos == 0) {
      if (state.hideFABs) {
        emit(state.copyWith(hideFABs: false));
      }
    } else if (event.maxPos - event.currentPos <= 10) {
      if (!state.hideFABs) {
        emit(state.copyWith(hideFABs: true));
      }
    } else {
      if (state.hideFABs) {
        emit(state.copyWith(hideFABs: false));
      }
    }
  }

  Future<void> _downloadTicket(
    DownloadTicketEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    final ticket = state.tickets.firstWhereOrNull((e) => e.id == event.id);

    if (ticket == null) {
      emit(state.withError('Билет на найден'));
      emit(state);
      return;
    }

    try {
      final bytes = await _ticketStorageProvider.download(
        uri: Uri.parse(ticket.url),
        filename: ticket.name,
        onLoadProgressChanged: (current, total) {
          add(
            UpdateLoadingProgressEvent(
              id: event.id,
              current: current,
              total: total,
            ),
          );
        },
      );

      final updatedTicket = ticket.copyWith(
        loadingState: const TicketLoadedState(
          desc: _loadedDesc,
        ),
      );

      final tickets = List.of(state.tickets);

      final index = tickets.indexWhere((e) => e.id == ticket.id);

      if (index == -1) {
        return;
      }

      emit(
        state.copyWith(
          tickets: tickets..[index] = updatedTicket,
        ),
      );
    } catch (e) {
      emit(state.withError('Не удалось загрузить билет'));
      emit(state);
    }
  }

  Future<void> _pauseDownloadTicket(
    PauseDownloadTicketEvent event,
    Emitter<TicketStorageState> emit,
  ) async {}

  Future<void> _updateLoadingProgress(
    UpdateLoadingProgressEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    final tickets = List.of(state.tickets);

    final index = tickets.indexWhere((e) => e.id == event.id);

    if (index == -1) {
      return;
    }

    final ticket = tickets[index];

    if (event.current == event.total) {
      final updatedTicket = ticket.copyWith(
        loadingState: const TicketLoadedState(
          desc: _loadedDesc,
        ),
      );

      emit(
        state.copyWith(
          tickets: tickets..[index] = updatedTicket,
        ),
      );

      return;
    }

    final current = _bToMB(event.current);
    final total = _bToMB(event.total);

    final updatedTicket = ticket.copyWith(
      loadingState: TicketIsLoadingState(
        desc: _formatString(
          _isLoadingDesc,
          [current, total],
        ),
        progress: current / total,
      ),
    );

    emit(
      state.copyWith(
        tickets: tickets..[index] = updatedTicket,
      ),
    );
  }

  double _bToMB(int bytesAmount) {
    return bytesAmount / 1000000;
  }

  String _formatString(String str, List<Object> args) {
    var res = str;
    var argI = 0;

    while (res.contains(_formatSymbol) && argI < args.length) {
      res = res.replaceFirst(_formatSymbol, args[argI].toString());

      argI++;
    }

    return res;
  }
}
