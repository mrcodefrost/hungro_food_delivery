import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hungro_food_delivery/features/feature_one/presentation/view/widgets/custom_button.dart';

import '../../../../feature_one/presentation/view/delivery_progress_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm Payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('Card Number: $cardNumber'),
                      Text('Expiry Date: $expiryDate'),
                      Text('Card Holder Name: $cardHolderName'),
                      Text('CVV: $cvvCode'),
                    ],
                  ),
                ),
                actions: [
                  // Cancel Button
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),

                  // Yes Button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryProgressScreen()));
                      },
                      child: const Text("Yes")),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Credit card
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (creditCardBrand) {}),

            // Credit card form

            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey),

            const SizedBox(
              height: 20,
            ),

            CustomButton(
                onTap: () {
                  userTappedPay();
                },
                text: 'Pay Now')
          ],
        ),
      ),
    );
  }
}
