import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.airplane_ticket_outlined),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Ticket 1'),
          LinearProgressIndicator(
            value: 0.3,
          ),
        ],
      ),
      subtitle: const Text('Waiting'),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.cloud_download_outlined),
      ),
    );
  }
}
