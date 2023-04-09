import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/view_models.dart';

part 'ticket_storage_event.dart';

part 'ticket_storage_state.dart';

const _waitsForLoadingDesc = 'Ожидает начала загрузки';
const _isLoadingDesc = 'Загружается % из %';
const _loadedDesc = 'Файл загружен';

class TicketStorageBloc extends Bloc<TicketStorageEvent, TicketStorageState> {
  TicketStorageBloc() : super(const TicketStorageState()) {
    on<AddTickerUrlEvent>(_addTicketUrl);
    on<ChangeScrollPosEvent>(_changeScrollPos);
  }

  Future<void> _addTicketUrl(
    AddTickerUrlEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    final filename = event.url.substring(event.url.lastIndexOf('/') + 1);

    emit(
      state.copyWith(
        newTicketIsAdded: true,
        tickets: List.from(state.tickets)
          ..addAll(
            List.generate(
              10,
              (index) => TicketVM(
                name: filename,
                loadingState: const TicketWaitsForLoadingState(
                  desc: _waitsForLoadingDesc,
                ),
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
}
