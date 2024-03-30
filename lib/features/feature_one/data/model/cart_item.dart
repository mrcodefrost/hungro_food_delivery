import 'food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);

    return (food.price + addonsPrice) * quantity;
  }

  // created to handle shared preferences
  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'selectedAddons': selectedAddons.map((addon) => addon.toJson()).toList(),
      'quantity': quantity, // Include the total price in the JSON data
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      food: Food.fromJson(json['food']),
      selectedAddons: (json['selectedAddons'] as List<dynamic>)
          .map((addonJson) => Addon.fromJson(addonJson))
          .toList(),
      quantity: json['quantity'] as int,
    );
  }
}
