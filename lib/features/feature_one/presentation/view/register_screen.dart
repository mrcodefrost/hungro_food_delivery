import 'package:flutter/material.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

          // sign in button

          CustomButton(onTap: () {}, text: 'Sign In'),

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
