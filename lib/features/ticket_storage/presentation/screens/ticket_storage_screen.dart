import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../application/blocs/ticket_storage/ticket_storage_bloc.dart';
import '../widgets/widgets.dart';

final _getIt = GetIt.instance;

/// Экран “Хранения билетов”.
class TicketStorageScreen extends StatelessWidget {
  const TicketStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<TicketStorageBloc>(),
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
    final bloc = context.read<TicketStorageBloc>();

    return BlocConsumer<TicketStorageBloc, TicketStorageState>(
      listener: (context, state) {
        if (state.hasError) {
          createSnackBar(context, message: state.error);
        }

        if (state.newTicketIsAdded) {
          createSnackBar(context, message: 'Билет успешно добавлен!');
        }
      },
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

        return NotificationListener(
          onNotification: (Notification notification) {
            if (notification is ScrollNotification) {
              bloc.add(
                ChangeScrollPosEvent(
                  currentPos: notification.metrics.pixels,
                  maxPos: notification.metrics.maxScrollExtent,
                ),
              );

              return true;
            }

            return false;
          },
          child: SafeArea(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.tickets.length,
              itemBuilder: (context, index) {
                final ticket = state.tickets[index];

                return TicketCard(
                  ticket: ticket,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketStorageBloc, TicketStorageState>(
      builder: (context, state) {
        if (state.hideFABs) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () => _showAddUrlAlert(context),
              label: const Text('Добавить'),
            ),
            if (state.showLoadAllBtn) ...[
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Загрузить все'),
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _showAddUrlAlert(BuildContext context) async {
    final bloc = context.read<TicketStorageBloc>();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bloc,
          child: const _UrlAlertDialog(),
        );
      },
    );
  }
}

class _UrlAlertDialog extends StatefulWidget {
  const _UrlAlertDialog();

  @override
  State<_UrlAlertDialog> createState() => _UrlAlertDialogState();
}

class _UrlAlertDialogState extends State<_UrlAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  final _canBeAddedNotifier = ValueNotifier(false);
  var _url = '';

  @override
  void dispose() {
    super.dispose();

    _canBeAddedNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TicketStorageBloc>();

    return AlertDialog(
      title: const Text('Добавление билета'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                onChanged: _onUrlChanged,
                validator: _urlValidator,
                decoration: const InputDecoration(
                  labelText: 'Введите url',
                ),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: _canBeAddedNotifier,
          builder: (context, canBeAdded, snapshot) {
            return ElevatedButton(
              onPressed: canBeAdded
                  ? () {
                      bloc.add(AddTickerUrlEvent(url: _url));
                      Navigator.of(context).pop();
                    }
                  : null,
              child: const Text('Добавить'),
            );
          },
        ),
      ],
    );
  }

  void _onUrlChanged(String value) {
    _url = value;
    final isValidUrl =
        _formKey.currentState?.validate() == true && _url.isNotEmpty;
    _canBeAddedNotifier.value = isValidUrl;
  }

  String? _urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    try {
      if (!Uri.parse(value).isAbsolute) {
        throw Exception('Url is not absolute');
      }

      return null;
    } catch (e) {
      return 'Введите корректный Url';
    }
  }
}
