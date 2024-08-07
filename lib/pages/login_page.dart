// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trueque_tech/pages/login_pages/signUp_page.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:trueque_tech/pages/dash_board_page.dart';
import 'package:trueque_tech/utils/auth.dart';
import 'package:trueque_tech/utils/snackbar.dart';
import 'package:trueque_tech/utils/strings.dart';

class LoginPage extends StatelessWidget {
  static const String routename = 'Login';
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  //const LoginPage({super.key});
  final AuthService _auth = AuthService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          AppColors.color2,
          AppColors.color3,
          AppColors.color1
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        AppStrings.iniciarSesion,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        AppStrings.bienvenido,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ]),
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  FormBuilderTextField(
                                    name: 'user',
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(20),
                                        hintText: AppStrings.hintEmail,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                  FormBuilderTextField(
                                    name: 'pass',
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(20),
                                        hintText: AppStrings.hintPassword,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: const Text(
                            AppStrings.hintForgotPassword,
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 200,
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: () async {
                                _formKey.currentState?.save();
                                if (_formKey.currentState?.validate() == true) {
                                  final v = _formKey.currentState?.value;
                                  if (v?['user'] != null &&
                                      v?['pass'] != null) {
                                    var result =
                                        await _auth.singInEmailAnsPassword(
                                            v?['user'], v?['pass']);

                                    //Una pequeña validacion
                                    switch (result) {
                                      case 1:
                                        showSnackBar(context,
                                            AppStrings.userOrEmailFail);
                                        break;
                                      case 2:
                                        showSnackBar(context,
                                            AppStrings.userOrEmailFail);
                                        break;
                                      case != null:
                                        Navigator.popAndPushNamed(
                                            context, DashboardPage.routename);
                                      default:
                                    }
                                  } else {
                                    showSnackBar(
                                        context, AppStrings.formNotNull);
                                  }
                                }
                              },
                              height: 50,
                              color: AppColors.BotonesApp,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text(
                                  AppStrings.btnLogin,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: const Text(
                            AppStrings.loginMethods,
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 150,
                            child: FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: MaterialButton(
                                  onPressed: () async {
                                    User? user = await _auth.signInWithGoogle();
                                    if (user != null) {
                                      Navigator.popAndPushNamed(
                                          context, DashboardPage.routename);
                                    } else {
                                      print("error en algo");
                                    }
                                  },
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/google.svg",
                                        width: 32,
                                        height: 32,
                                      ),
                                      SizedBox(width: 10),
                                      Text(AppStrings.GoogleLogin),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: const Text(
                            AppStrings.toSignUpMessage,
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUp.routename);
                            },
                            child: const Text(
                              AppStrings.toSignUp,
                              style: TextStyle(
                                  color: AppColors.color1,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
