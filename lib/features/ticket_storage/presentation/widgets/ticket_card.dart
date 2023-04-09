import 'package:flutter/material.dart';

import '../../application/view_models/ticket_loading_state.dart';
import '../../application/view_models/ticket_vm/ticket_vm.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.ticket,
    required this.trailingIcon,
    required this.onTrailingPressed,
  });

  final TicketVM ticket;
  final IconData trailingIcon;
  final VoidCallback? onTrailingPressed;

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
            onPressed: onTrailingPressed,
            icon: Icon(
              trailingIcon,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

}
