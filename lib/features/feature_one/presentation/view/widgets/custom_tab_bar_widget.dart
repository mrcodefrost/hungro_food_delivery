import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/food.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last.toUpperCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        isScrollable: true,
      ),
    );
  }
}
