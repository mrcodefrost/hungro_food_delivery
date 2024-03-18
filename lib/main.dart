import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/login_screen.dart';
import 'package:hungro_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(
        onTap: () {},
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
