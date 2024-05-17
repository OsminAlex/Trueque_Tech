import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trueque_tech/pages/login_page.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:animate_do/animate_do.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [AppColors.color2, AppColors.color3, AppColors.color1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: IconButton(
            //     icon: Icon(Icons.arrow_back, color: Colors.white),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sobre Ti",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Bienvenido a tu perfil",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/user_avatar.jpg'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gal Gadot',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      _buildIconButton(Icons.info, 'Información Personal'),
                      SizedBox(height: 20),
                      _buildIconButton(
                        Icons.favorite,
                        'Favoritos',
                      ),
                      SizedBox(height: 20),
                      _buildIconButton(
                        Icons.shopping_cart,
                        'Lista de Compras',
                      ),
                      SizedBox(height: 20),
                      _buildIconButton(Icons.exit_to_app, 'Cerrar Sesión',
                          onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.popAndPushNamed(context, LoginPage.routename);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(icon, size: 30, color: AppColors.color2),
            SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: AppColors.color2),
            ),
          ],
        ),
      ),
    );
  }
}
