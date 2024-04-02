import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../data/model/food.dart';
import '../../data/model/restaurant.dart';

class FoodScreen extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodScreen({super.key, required this.food}) {
    // initialize selected addons to be false in the beginning
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page to go back to the menu

    Navigator.pop(context);

    // format the selected addons

    List<Addon> currentlySelectedAddons = [];

    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // accessing the add to cart method in the Restaurant class
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image

                Image.asset(
                  widget.food.imagePath,
                  width: double.infinity,
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name

                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // food prices

                      Text(
                        'Rs.${widget.food.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      // food description

                      Text(widget.food.description),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // addons
                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              // get individual addon
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(addon.price.toString()),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      )
                    ],
                  ),
                ),

                // button => add to cart
                CustomButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: 'Add to Cart'),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),

        // Back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(top: 15, left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
