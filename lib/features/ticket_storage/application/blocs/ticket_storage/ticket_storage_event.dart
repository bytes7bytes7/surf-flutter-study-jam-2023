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

class DownloadTicketEvent extends TicketStorageEvent {
  const DownloadTicketEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

class PauseDownloadTicketEvent extends TicketStorageEvent {
  const PauseDownloadTicketEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

class UpdateLoadingProgressEvent extends TicketStorageEvent {
  const UpdateLoadingProgressEvent({
    required this.id,
    required this.current,
    required this.total,
  });

  final String id;
  final int current;
  final int total;

  @override
  List<Object?> get props => [
        id,
        current,
        total,
      ];
}
