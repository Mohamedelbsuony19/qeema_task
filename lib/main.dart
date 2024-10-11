import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qeema_task/main_app.dart';

import 'core/constants/local_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: AppConstants.firebaseOptions);
  runApp(const MainApp());
}
