import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/cart_item.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

  final List<Food> _menu = [
    // burgers
    Food(
        name: 'Classic Cheeseburger',
        description:
            'A juicy paneer patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
        imagePath: 'assets/images/burgers.jpg',
        price: 69.00,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Cheese', price: 20),
          Addon(name: 'Paneer Patty', price: 30),
          Addon(name: 'Mustard Sauce', price: 2),
        ]),

    // create more of same items

    // salad
    Food(
        name: 'Grilled Chicken Salad',
        description:
            'Grilled chicken diced and tossed in bowl of tomato, lettuce, carrot and olice with vinegar and spicy sauces',
        imagePath: 'assets/images/salads.jpg',
        price: 400,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Lime Soda', price: 100),
          Addon(name: 'Green Apple Mojito', price: 120),
        ]),

    // slides
    Food(
        name: 'Paneer Tikka',
        description:
            'Big and soft pieces of paneer cooked in the Mitti ka Tandoor for the most dense flavours',
        imagePath: 'assets/images/slides.jpg',
        price: 300,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
          Addon(name: 'Green Apple Mojito', price: 120),
        ]),

    // desserts
    Food(
        name: 'Honey Pancake',
        description: 'Soft and Healthy pancakes drizzled with honey',
        imagePath: 'assets/images/desserts.jpg',
        price: 400,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
          Addon(name: 'Green Apple Mojito', price: 120),
        ]),

    // drinks
    Food(
        name: 'Lime Water',
        description:
            'Fresh and lime juice mixed with sparkling water and shikanji masala',
        imagePath: 'assets/images/drinks.jpg',
        price: 300,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
          Addon(name: 'Green Apple Mojito', price: 120),
        ]),
  ];

  // GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // OPERATIONS

  // user cart
  final List<CartItem> _cart = [];

// add to cart

  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons

    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of the selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists then increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

// remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

// get total price of cart

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

//get total number of items

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // HELPERS

// generate a receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln('------------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('  Addons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt.writeln('=============');
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

// format double value into money/currency

  String _formatPrice(double price) {
    return 'Rs.${price.toStringAsFixed(2)}';
  }

// format list of addons in a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(',');
  }
}
