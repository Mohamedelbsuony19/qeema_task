import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qeema_task/main_app.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAe67nf91pZaKOXz2YrdN8FvykpOgl0DOE',
    appId: '1:795210531584:android:afc55087f884f15c5be9e5',
    messagingSenderId: '795210531584',
    projectId: 'qeema-df33c',
  ));
  await initDependencies();
  runApp(const MainApp());
}
