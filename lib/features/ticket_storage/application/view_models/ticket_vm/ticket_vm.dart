import 'package:freezed_annotation/freezed_annotation.dart';

import '../ticket_loading_state.dart';

part 'ticket_vm.freezed.dart';

@freezed
class TicketVM with _$TicketVM {
  const factory TicketVM({
    required String name,
    required TicketLoadingState loadingState,
  }) = _TicketVM;
}
