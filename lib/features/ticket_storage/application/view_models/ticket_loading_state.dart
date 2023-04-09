import 'package:equatable/equatable.dart';

abstract class TicketLoadingState extends Equatable {
  const TicketLoadingState({required this.desc});

  final String desc;

  @override
  List<Object?> get props => [
        desc,
      ];
}

class TicketWaitsForLoadingState extends TicketLoadingState {
  const TicketWaitsForLoadingState({required super.desc});
}

class TicketIsLoadingState extends TicketLoadingState {
  const TicketIsLoadingState({
    required super.desc,
    required this.progress,
  });

  final double progress;

  @override
  List<Object?> get props => [
        ...super.props,
        progress,
      ];
}

class TicketLoadedState extends TicketLoadingState {
  const TicketLoadedState({required super.desc});
}
