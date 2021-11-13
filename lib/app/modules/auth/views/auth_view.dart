import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
      title: 'Blood Donation',
      theme: LoginTheme(
        footerBackgroundColor: Colors.white,
        //pageColorLight: Colors.white,
        //pageColorDark: Colors.white
      ),
      hideSignUpButton: true,
      hideForgotPasswordButton: true,

      //logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: (_){},
      onSignup: (_){},
      onSubmitAnimationCompleted: () {
        Get.offAllNamed('/dashboard');
        //Navigator.of(context).pushReplacement(MaterialPageRoute(
          //builder: (context) => DashboardScreen(),
        //));
      },
      onRecoverPassword: (_){},
      )
    );
  }
}
