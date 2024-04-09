import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/authentication/data/provider/remote/auth_service.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_button.dart';
import 'package:hungro_food_delivery/utils/constants/app_constants.dart';
import 'package:hungro_food_delivery/utils/validations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../common/presentation/view/widgets/copy_text_button.dart';
import '../../../../feature_one/presentation/view/widgets/custom_textfield.dart';
import '../../../domain/usecase/loading_user_provider.dart';

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
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    loadingProvider.setLoading(true);

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
          title: Text('Error Occured : $e'),
        ),
      );
    } finally {
      // navigate to home using auth gate
      loadingProvider.setLoading(false);
    }
  }

  void quickLogin() async {
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    loadingProvider.setLoading(true);

    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword('testone@test.com', 'testone');
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error Occured : $e'),
        ),
      );
    } finally {
      loadingProvider.setLoading(false);
    }
  }

  Future<void> _refresh() async {
    // reloading takes some time..
    setState(() {});
    return await Future.delayed(const Duration(seconds: 2));
  }

  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = NetworkLottie(AppAnimations.logo).load();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(
        builder: (context, loadingProvider, child) {
      return loadingProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: LiquidPullToRefresh(
                // always have a Listview
                onRefresh: _refresh,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                child: ListView(
                  children: [
                    // logo
                    const SizedBox(
                      height: 65,
                    ),
                    kIsWeb
                        ? Icon(
                            Icons.fastfood_rounded,
                            size: 200,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )
                        : FutureBuilder<LottieComposition>(
                            future: _composition,
                            builder: (context, snapshot) {
                              var composition = snapshot.data;
                              if (composition != null) {
                                return Lottie(
                                    composition: composition,
                                    frameRate: FrameRate.max,
                                    height: 200,
                                    width: 200);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),

                    const SizedBox(
                      height: 25,
                    ),

                    // message, app slogan

                    Text(
                      'HUNGRO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Demo ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ID: testone@test.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const CopyTextButton(textToCopy: 'testone@test.com'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Pass: testone',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const CopyTextButton(textToCopy: 'testone'),
                        ],
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
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // quick sign in button
                    const SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {
                          quickLogin();
                        },
                        child: Text('Quick Sign In')),
                  ],
                ),
              ),
            );
    });
  }
}
