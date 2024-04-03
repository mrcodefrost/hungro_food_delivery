import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/cart_screen.dart';
import 'package:provider/provider.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const CustomSliverAppBar(
      {super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: kIsWeb ? 340 : 380,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      stretchTriggerOffset: 200,
      actions: [
        // cart button

        Consumer<Restaurant>(builder: (context, restaurant, child) {
          // fetching the cart
          final userCart = restaurant.cart;

          return IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen())),
              icon: userCart.isEmpty
                  ? const Icon(Icons.shopping_cart)
                  : Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart_checkout,
                        ),
                        Positioned(
                          top: 1,
                          right: 0,
                          child: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.primary,
                            size: 10,
                          ),
                        )
                      ],
                    ));
        })
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('H U N G R O'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
