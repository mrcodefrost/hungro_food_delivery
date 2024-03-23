import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/cart_item.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/quantity_selector_widget.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  // Food item
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                            width: 100,
                          ),
                        ),

                        // name and price

                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // food name
                            Text(cartItem.food.name),

                            // food price
                            Text(
                              'Rs.${cartItem.food.price}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // increment or decrement the count

                            QuantitySelector(
                              quantity: cartItem.quantity,
                              food: cartItem.food,
                              onIncrement: () {
                                restaurant.addToCart(
                                    cartItem.food, cartItem.selectedAddons);
                              },
                              onDecrement: () {
                                restaurant.removeFromCart(cartItem);
                              },
                            )
                          ],
                        ),
                        // increment or decrement quantity
                      ],
                    ),
                  ),

                  // addons
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      children: cartItem.selectedAddons
                          .map((addon) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      // addon name
                                      Text(addon.name),

                                      // addon price
                                      Text(' Rs.${addon.price}'),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 12,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
