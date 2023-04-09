part of 'ticket_storage_bloc.dart';

class TicketStorageState extends Equatable {
  const TicketStorageState({
    this.isLoading = false,
    this.error = '',
    this.tickets = const [],
    this.newTicketIsAdded = false,
    this.hideFABs = false,
  });

  final bool isLoading;

  final String error;

  final List<TicketVM> tickets;

  final bool newTicketIsAdded;

  final bool hideFABs;

  bool get hasError => error.isNotEmpty;

  bool get hasNoTickets => tickets.isEmpty;

  bool get showLoadAllBtn {
    var hasUnloaded = false;
    for (final t in tickets) {
      if (t.loadingState is TicketWaitsForLoadingState) {
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
    bool? newTicketIsAdded = false,
    bool? hideFABs,
  }) {
    return TicketStorageState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      tickets: List.of(tickets ?? this.tickets),
      newTicketIsAdded: newTicketIsAdded ?? this.newTicketIsAdded,
      hideFABs: hideFABs ?? this.hideFABs,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        tickets,
        newTicketIsAdded,
        hideFABs,
      ];
}
