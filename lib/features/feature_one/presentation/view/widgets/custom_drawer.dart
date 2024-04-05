import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/authentication/data/provider/remote/auth_service.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_drawer_tile.dart';
import 'package:hungro_food_delivery/utils/constants/app_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../themes/theme_provider.dart';
import '../settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo

          const SizedBox(
            height: 50,
          ),

          kIsWeb
              ? Icon(
                  Icons.fastfood_rounded,
                  size: 200,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              : Lottie.network(AppAnimations.logo, height: 200, width: 200),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile

          CustomDrawerTile(
            text: 'H O M E',
            onTap: () => Navigator.pop(context),
            icon: Icons.home,
          ),

          Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              ? CustomDrawerTile(
                  text: 'L I G H T  M O D E',
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  icon: Icons.sunny,
                )
              : CustomDrawerTile(
                  text: 'D A R K  M O D E',
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  icon: Icons.nightlight,
                ),
          // settings list tile

          CustomDrawerTile(
            text: 'S E T T I N G S',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            icon: Icons.settings,
          ),

          const Spacer(),
          // logout list tile
          CustomDrawerTile(
            text: 'L O G O U T',
            onTap: logout,
            icon: Icons.logout,
          ),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
