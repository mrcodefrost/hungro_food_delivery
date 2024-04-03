import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/food.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/food_screen.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/location_search_screen.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_drawer.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_sliver_app_bar.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_tab_bar_widget.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/description_box_widget.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/food_tile_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/current_location_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // Tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(
      FoodCategory foodCategory, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == foodCategory).toList();
  }

  // return list of foods in a given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((foodCategory) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(foodCategory, fullMenu);

      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            // get individual food
            final food = categoryMenu[index];
            // return food tile UI
            return FoodTile(
                food: food,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodScreen(food: food)));
                });
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomSliverAppBar(
              title: CustomTabBar(
                tabController: _tabController,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  Visibility(
                    visible:
                        !kIsWeb, // Show the widget only if not running on web
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationSearchScreen(),
                          ),
                        );
                      },
                      child: const Text('Search Location'),
                    ),
                  ),

                  // my current location
                  CurrentLocation(),

                  // description box
                  const DescriptionBox(),
                ],
              ))
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu));
          },
        ),
      ),
    );
  }
}
