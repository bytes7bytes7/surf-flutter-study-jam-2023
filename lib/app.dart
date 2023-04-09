import 'package:flutter/material.dart';

import 'features/ticket_storage/presentation/screens/ticket_storage_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicketStorageScreen(),
    );
  }
}
