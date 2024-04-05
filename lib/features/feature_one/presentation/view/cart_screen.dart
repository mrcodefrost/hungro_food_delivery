import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/cart_tile_widget.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../payment/presentation/view/screens/payment_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                              'Are you sure you want to empty the cart?'),
                          actions: [
                            // cancel button
                            TextButton(
                                onPressed: () {
                                  // cancel the dialog and pop the dialog
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),

                            // yes button
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child: const Text('Yes')),
                          ],
                        ));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // list of items in cart

              userCart.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text('So lonely in here..'))
                  : Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get individual cart item
                                  final cartItem = userCart[index];

                                  // return cart tile UI
                                  return CartTile(cartItem: cartItem);
                                }),
                          ),
                        ],
                      ),
                    ),

              // button to pay
              userCart.isEmpty
                  ? Container()
                  : CustomButton(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen())),
                      text: 'Go to Checkout'),

              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      );
    });
  }
}
