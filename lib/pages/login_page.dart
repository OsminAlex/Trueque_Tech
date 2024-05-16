// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: MaterialButton(
                            onPressed: () async {
                              _formKey.currentState?.save();
                              if (_formKey.currentState?.validate() == true) {
                                final v = _formKey.currentState?.value;
                                if (v?['user'] != null && v?['pass'] != null) {
                                  var result = await _auth.createAcount(
                                      v?['user'], v?['pass']);
                                  // El resto de tu código...

                                  if (result == 1) {
                                    showSnackBar(context,
                                        "La contraseña es demasiado debil");
                                  } else if (result == 2) {
                                    showSnackBar(
                                        context, "El email ya está en uso");
                                  } else if (result != null) {
                                    Navigator.popAndPushNamed(
                                        context, DashBoardPage.routename);
                                  }
                                } else {
                                  print(
                                      'Los campos de usuario y contraseña no pueden ser nulos');
                                }

                                // switch (result) {
                                //   case 1:
                                //     showSnackBar(context, "Error, password demasiado devil");
                                //     break;
                                //   case 2:
                                //     showSnackBar(
                                //         context, "Error, email ya en uso");
                                //     break;
                                //   case != null:
                                //     Navigator.popAndPushNamed( context, DashBoardPage.routename);
                                //   default:
                                // }
                              }

                              //showSnackBar(context, "Iniciando sesion...");
                            },
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: AppColors.BotonesApp,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: const Center(
                              child: Text(
                                AppStrings.login,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
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
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(
                                duration: const Duration(milliseconds: 1800),
                                child: MaterialButton(
                                  onPressed: () {},
                                  height: 50,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/facebook.svg",
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  // child: const Center(
                                  //   child: Text(
                                  //     AppStrings.FacebookLogin,
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.bold),
                                  //   ),
                                  // ),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: MaterialButton(
                                  onPressed: () {},
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/google.svg",
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  // child: const Center(
                                  //   child: Text(
                                  //     AppStrings.GoogleLogin,
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.bold),
                                  //   ),
                                  // ),
                                )),
                          )
                        ],
                      )
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
