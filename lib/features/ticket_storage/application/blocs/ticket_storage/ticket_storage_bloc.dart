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
  }

  Future<void> _addTicketUrl(
    AddTickerUrlEvent event,
    Emitter<TicketStorageState> emit,
  ) async {
    emit(
      state.copyWith(
        tickets: List.from(state.tickets)
          ..add(
            TicketVM(
              name: 'Ticket ${state.tickets.length + 1}',
              loadingState: const TicketWaitsForLoadingState(
                desc: _waitsForLoadingDesc,
              ),
            ),
          ),
      ),
    );
  }
}
