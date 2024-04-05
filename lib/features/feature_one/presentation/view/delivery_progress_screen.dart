import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/common/data/provider/remote/firestore_service.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/receipt_widget.dart';
import 'package:provider/provider.dart';

class DeliveryProgressScreen extends StatefulWidget {
  const DeliveryProgressScreen({super.key});

  @override
  State<DeliveryProgressScreen> createState() => _DeliveryProgressScreenState();
}

class _DeliveryProgressScreenState extends State<DeliveryProgressScreen> {
  // get access to database
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress...'),
        backgroundColor: Colors.transparent,
      ),
      body: const SingleChildScrollView(
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
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    padding: const EdgeInsets.all(25),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
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
                icon: const Icon(Icons.message),
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
                icon: const Icon(Icons.call),
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
