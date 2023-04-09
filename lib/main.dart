import 'package:flutter/material.dart';

import 'app.dart';
import 'features/main/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configInjector(env: 'prod');

  runApp(const App());
}
