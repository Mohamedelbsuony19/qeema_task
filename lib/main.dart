import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qeema_task/main_app.dart';

import 'core/constants/app_constants.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: AppConstants.firebaseOptions);
  await initDependencies();
  runApp(const MainApp());
}
