import 'package:flutter/material.dart';
import 'package:qeema_task/main_app.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainApp());
}
