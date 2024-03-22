import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // textstyle

    var primaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    var secondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery fee

          Column(
            children: [
              Text(
                'Rs. 99',
                style: primaryTextStyle,
              ),
              Text(
                'Delivery fee',
                style: secondaryTextStyle,
              ),
            ],
          ),

          // delivery time

          Column(
            children: [
              Text(
                '30-40 min',
                style: primaryTextStyle,
              ),
              Text(
                'Delivery Time',
                style: secondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
