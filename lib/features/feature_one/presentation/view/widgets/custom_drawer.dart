import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/domain/auth_service.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_drawer_tile.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

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
