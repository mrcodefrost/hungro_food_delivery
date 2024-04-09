import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/authentication/data/provider/remote/auth_service.dart';
import 'package:hungro_food_delivery/utils/validations.dart';

import '../../../../feature_one/presentation/view/widgets/custom_button.dart';
import '../../../../feature_one/presentation/view/widgets/custom_textfield.dart';

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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method

  void register() async {
    // get auth service
    final authService = AuthService();

    // check if the passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user

      try {
        await authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }

    // if passwords don't match -> show error

    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Passwords don\'t match'),
              ));
    }
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
            'Let\'s create an account for you',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // email textfield

          CustomTextFormField(
            textEditingController: emailController,
            hintText: 'Email Address',
            obscureText: false,
            inputFormatters: [
              Validations.trimSpaces(),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          // password textfield

          CustomTextFormField(
            textEditingController: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(
            height: 10,
          ),

          // confirm password textfield

          CustomTextFormField(
            textEditingController: confirmPasswordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(
            height: 25,
          ),

          // sign in button

          CustomButton(onTap: register, text: 'Sign Up'),

          const SizedBox(
            height: 25,
          ),

          // Already have an account ? Login here

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  'Login Now',
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
