part of 'ticket_storage_bloc.dart';

abstract class TicketStorageEvent extends Equatable {
  const TicketStorageEvent();

  @override
  List<Object?> get props => [];
}

class AddTickerUrlEvent extends TicketStorageEvent {
  const AddTickerUrlEvent({
    required this.url,
  });

  final String url;

  @override
  List<Object?> get props => [url];
}

class ChangeScrollPosEvent extends TicketStorageEvent {
  const ChangeScrollPosEvent({
    required this.currentPos,
    required this.maxPos,
  });

  final double currentPos;
  final double maxPos;

  @override
  List<Object?> get props => [
        currentPos,
        maxPos,
      ];
}
