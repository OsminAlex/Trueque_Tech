import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trueque_tech/firebase_options.dart';
import 'package:trueque_tech/pages/dash_board_page.dart';
import 'package:trueque_tech/pages/login_page.dart';
import 'package:trueque_tech/pages/login_pages/signUp_page.dart';
import 'package:trueque_tech/preferences/pref_users.dart';
import 'package:trueque_tech/pages/shop_list.dart';
import 'package:trueque_tech/pages/favorite_page.dart';
import 'package:trueque_tech/pages/profile_page.dart';
import 'package:trueque_tech/pages/publish_page.dart';
import 'package:trueque_tech/pages/chat_page.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimapagina,
      routes: {
        //Paginas SignIn y SingUp, osea el login
        LoginPage.routename: (context) => LoginPage(),
        SignUp.routename: (context) => SignUp(),

        //Dashbiard pages
        DashBoardPage.routename: (context) => const DashBoardPage(),
        FavoritePage.routename: (context) => const FavoritePage(),
        ProfilePage.routename: (context) => const ProfilePage(),
        ShopList.routename: (context) => const ShopList(),
        PublishPage.routename: (context) => const PublishPage(),
        ChatPage.routename: (context) => const ChatPage(),
      },
    );
  }
}
