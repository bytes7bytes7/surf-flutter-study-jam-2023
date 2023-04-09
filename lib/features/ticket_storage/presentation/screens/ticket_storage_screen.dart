import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/blocs/ticket_storage/ticket_storage_bloc.dart';
import '../widgets/widgets.dart';

/// Экран “Хранения билетов”.
class TicketStorageScreen extends StatelessWidget {
  const TicketStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketStorageBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Хранение билетов'),
            ),
            body: const _Body(),
            floatingActionButton: const _FAB(),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketStorageBloc, TicketStorageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.hasError) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state.hasNoTickets) {
          return const Center(
            child: Text('Здесь пока ничего нет'),
          );
        }

        return ListView.builder(
          itemCount: state.tickets.length,
          itemBuilder: (context, index) {
            return const TicketCard();
          },
        );
      },
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
    final bloc = context.read<TicketStorageBloc>();
    var url = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавление билета'),
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
                bloc.add(AddTickerUrlEvent(url: url));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
