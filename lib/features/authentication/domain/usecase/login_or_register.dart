import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/authentication/presentation/view/screen/login_screen.dart';
import 'package:hungro_food_delivery/features/authentication/presentation/view/screen/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show the login page

  bool showLogInPage = true;

  // toggle between login and register page

  void togglePages() {
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return RegisterScreen(onTap: togglePages);
    }
  }
}
