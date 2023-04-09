import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

/// Экран “Хранения билетов”.
class TicketStorageScreen extends StatelessWidget {
  const TicketStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            TicketCard(),
          ],
        ),
      ),
      floatingActionButton: const _FAB(),
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          onPressed: () => _showAddUrlAlert(context),
          label: const Text('Добавить'),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Загрузить все'),
        ),
      ],
    );
  }

  Future<void> _showAddUrlAlert(BuildContext context) async {
    var url = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  onChanged: (value) {
                    url = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Введите url',
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              child: const Text('Добавить'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
