import 'package:equatable/equatable.dart';

abstract class TicketLoadingState extends Equatable {
  const TicketLoadingState();

  @override
  List<Object?> get props => [];
}

class TicketWaitsForLoadingState extends TicketLoadingState {
  const TicketWaitsForLoadingState();
}

class TicketIsLoadingState extends TicketLoadingState {
  const TicketIsLoadingState({
    required this.progress,
  });

  final double progress;

  @override
  List<Object?> get props => [progress];
}

class TicketLoadedState extends TicketLoadingState {
  const TicketLoadedState();
}
