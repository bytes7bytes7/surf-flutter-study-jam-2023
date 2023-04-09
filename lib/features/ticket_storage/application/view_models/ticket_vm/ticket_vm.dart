import 'package:freezed_annotation/freezed_annotation.dart';

import '../ticket_loading_state.dart';

part 'ticket_vm.freezed.dart';

@freezed
class TicketVM with _$TicketVM {
  const factory TicketVM({
    required String id,
    required String name,
    required String url,
    required TicketLoadingState loadingState,
  }) = _TicketVM;
}
