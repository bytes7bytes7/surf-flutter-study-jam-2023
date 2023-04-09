part of 'ticket_storage_bloc.dart';

class TicketStorageState extends Equatable {
  const TicketStorageState({
    this.isLoading = false,
    this.error = '',
    this.tickets = const [],
  });

  final bool isLoading;

  final String error;

  final List<TicketVM> tickets;

  bool get hasError => error.isNotEmpty;

  bool get hasNoTickets => tickets.isEmpty;

  bool get showLoadAllBtn {
    var hasUnloaded = false;
    for (final t in tickets) {
      if (t.loadingState is TicketWaitsForLoadingState ||
          t.loadingState is TicketLoadingPausedState) {
        hasUnloaded = true;
        break;
      }
    }

    return hasUnloaded;
  }

  TicketStorageState withLoading() => copyWith(
        isLoading: true,
      );

  TicketStorageState withError(String error) => copyWith(
        error: error,
        isLoading: false,
      );

  TicketStorageState withoutError() => copyWith();

  TicketStorageState copyWith({
    bool? isLoading,
    String? error = '',
    List<TicketVM>? tickets,
  }) {
    return TicketStorageState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      tickets: List.from(tickets ?? this.tickets),
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        tickets,
      ];
}
