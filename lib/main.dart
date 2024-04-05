import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/authentication/domain/usecase/auth_gate.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/domain/location_service.dart';
import 'package:hungro_food_delivery/firebase_options.dart';
import 'package:hungro_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'features/authentication/domain/usecase/loading_user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        // restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),

        // Location Provider
        ChangeNotifierProvider(create: (context) => LocationService()),

        // Login Loading Provider
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungro',
      debugShowCheckedModeBanner: false,
      home: const SelectionArea(child: AuthGate()),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
