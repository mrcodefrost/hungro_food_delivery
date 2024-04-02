import 'package:flutter/material.dart';

import '../../../data/model/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                // text food details
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs.${food.price}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      food.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                )),

                const SizedBox(
                  width: 15,
                ),
                // food image

                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        food.imagePath,
                        height: 120,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      child: Row(
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
