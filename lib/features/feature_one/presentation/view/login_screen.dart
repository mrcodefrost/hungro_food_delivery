import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/domain/auth_service.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_button.dart';

import 'widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // login method

  void login() async {
    // get instance of auth service

    final authService = AuthService();

    // try sign in

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }

    // display any errors

    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }

    // navigate to home using auth gate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo

          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(
            height: 25,
          ),

          // message, app slogan

          Text(
            'HUNGRO',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // email textfield

          CustomTextField(
            textEditingController: emailController,
            hintText: 'Email Address',
            obscureText: false,
          ),

          const SizedBox(
            height: 10,
          ),

          // password textfield

          CustomTextField(
            textEditingController: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(
            height: 25,
          ),
          // sign in button

          CustomButton(onTap: login, text: 'Sign In'),

          const SizedBox(
            height: 25,
          ),

          // not a member? register now

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not a member?'),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  'Register now',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
