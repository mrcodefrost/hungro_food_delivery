import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/receipt_widget.dart';

class DeliveryProgressScreen extends StatelessWidget {
  const DeliveryProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress...'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Receipt()],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}

// Custom bottom nav bar - Message / Call driver

Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    padding: EdgeInsets.all(25),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ),
        const SizedBox(
          width: 10,
        ),

        // driver details

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sarthak the driver',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              'Driver',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),

        const Spacer(),

        // message + call  button

        Row(
          children: [
            // message button

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            // call button

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
