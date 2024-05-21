import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trueque_tech/firebase_options.dart';
import 'package:trueque_tech/pages/dash_board_page.dart';
import 'package:trueque_tech/pages/login_page.dart';
import 'package:trueque_tech/pages/login_pages/signUp_page.dart';
import 'package:trueque_tech/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _getLandingPage(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Muestra un indicador de carga mientras se verifica el estado de inicio de sesión.
          } else {
            return snapshot.data ?? Container();
          }
        },
      ),
      routes: {
        //Paginas SignIn y SingUp, osea el login
        LoginPage.routename: (context) => LoginPage(),
        SignUp.routename: (context) => SignUp(),

        //Dashboard pages
        DashboardPage.routename: (context) => DashboardPage(),
        ChatPage.routename: (context) => const ChatPage(),
      },
    );
  }

  Future<Widget> _getLandingPage() async {
    return (FirebaseAuth.instance.currentUser != null)
        ? DashboardPage()
        : LoginPage();
  }
}
