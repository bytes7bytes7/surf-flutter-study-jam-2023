import 'package:flutter/material.dart';

import '../../application/view_models/ticket_loading_state.dart';
import '../../application/view_models/ticket_vm/ticket_vm.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.ticket,
  });

  final TicketVM ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final loadingState = ticket.loadingState;

    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.airplane_ticket_outlined),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ticket.name),
          if (loadingState is TicketIsLoadingState)
            LinearProgressIndicator(
              value: loadingState.progress,
            ),
        ],
      ),
      subtitle: Text(loadingState.desc),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              _getTrailingIcon(loadingState),
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTrailingIcon(TicketLoadingState state) {
    if (state is TicketWaitsForLoadingState) {
      return Icons.cloud_download_outlined;
    }

    if (state is TicketIsLoadingState) {
      return Icons.pause_circle_outlined;
    }

    if (state is TicketLoadingPausedState) {
      return Icons.play_circle_outlined;
    }

    return Icons.cloud_done;
  }
}
