import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trueque_tech/firebase_options.dart';
import 'package:trueque_tech/pages/login_page.dart';
import 'package:trueque_tech/preferences/pref_users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuaios.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final prefs = PreferenciasUsuaios();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: prefs.ultimapagina,
      routes: {LoginPage.routename: (context) => const LoginPage()},
    );
  }
}
