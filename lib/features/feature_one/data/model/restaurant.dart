import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/cart_item.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/food.dart';
import 'package:hungro_food_delivery/utils/constants/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

// Food categories { slides, rice, noodles, dimsums, soups, sushi, drinks }

  final List<Food> _menu = [
    // slides
    Food(
        name: MenuStrings.paneerChiliDry,
        description: MenuStrings.paneerChiliDryDescription,
        imagePath: MenuStrings.paneerChiliDryImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Extra Paneer', price: 50),
        ]),
    Food(
        name: MenuStrings.springRolls,
        description: MenuStrings.springRollsDescription,
        imagePath: MenuStrings.springRollsImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 30),
        ]),
    Food(
        name: MenuStrings.vegManchurianDry,
        description: MenuStrings.vegManchurianDryDescription,
        imagePath: MenuStrings.vegManchurianDryImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 30),
        ]),
    Food(
        name: MenuStrings.edamame,
        description: MenuStrings.edamameDescription,
        imagePath: MenuStrings.edamameImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 50),
        ]),
    Food(
        name: MenuStrings.tacos,
        description: MenuStrings.tacosDescription,
        imagePath: MenuStrings.tacosImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 30),
        ]),

    // create more of same items

    // rice - japanese, kimchi, wok
    Food(
        name: MenuStrings.chiliGarlicFriedRice,
        description: MenuStrings.chiliGarlicFriedRiceDescription,
        imagePath: MenuStrings.chiliGarlicFriedRiceImg,
        price: 400,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.japaneseFriedRice,
        description: MenuStrings.japaneseFriedRiceDescription,
        imagePath: MenuStrings.japaneseFriedRiceImg,
        price: 295,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.kimchiFriedRice,
        description: MenuStrings.kimchiFriedRiceDescription,
        imagePath: MenuStrings.kimchiFriedRiceImg,
        price: 310,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.vegWokTossedRice,
        description: MenuStrings.vegWokTossedRiceDescription,
        imagePath: MenuStrings.vegWokTossedRiceImg,
        price: 310,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),

    // Noodles
    Food(
      name: MenuStrings.chiliGarlicNoodles,
      description: MenuStrings.chiliGarlicNoodlesDescription,
      imagePath: MenuStrings.chiliGarlicNoodlesImg,
      price: 250,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.hakkaNoodles,
      description: MenuStrings.hakkaNoodlesDescription,
      imagePath: MenuStrings.hakkaNoodlesImg,
      price: 270,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.padThaiNoodles,
      description: MenuStrings.padThaiNoodlesDescription,
      imagePath: MenuStrings.padThaiNoodlesImg,
      price: 290,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.soggyNoodles,
      description: MenuStrings.soggyNoodlesDescription,
      imagePath: MenuStrings.soggyNoodlesImg,
      price: 310,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.teppanyakiNoodles,
      description: MenuStrings.teppanyakiNoodlesDescription,
      imagePath: MenuStrings.teppanyakiNoodlesImg,
      price: 330,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),

// Dimsums
    Food(
      name: MenuStrings.beetrootDumplings,
      description: MenuStrings.beetrootDumplingsDescription,
      imagePath: MenuStrings.beetrootDumplingsImg,
      price: 220,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.pattayaDimsums,
      description: MenuStrings.pattayaDimsumsDescription,
      imagePath: MenuStrings.pattayaDimsumsImg,
      price: 240,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.hunanMushrooms,
      description: MenuStrings.hunanMushroomsDescription,
      imagePath: MenuStrings.hunanMushroomsImg,
      price: 260,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.basilChicken,
      description: MenuStrings.basilChickenDescription,
      imagePath: MenuStrings.basilChickenImg,
      price: 280,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),

// Soups
    Food(
      name: MenuStrings.vegChineseWontons,
      description: MenuStrings.vegChineseWontonsDescription,
      imagePath: MenuStrings.vegChineseWontonsImg,
      price: 180,
      category: FoodCategory.soups,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.vegHotAndSour,
      description: MenuStrings.vegHotAndSourDescription,
      imagePath: MenuStrings.vegHotAndSourImg,
      price: 200,
      category: FoodCategory.soups,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.vegKhaoSueySoup,
      description: MenuStrings.vegKhaoSueySoupDescription,
      imagePath: MenuStrings.vegKhaoSueySoupImg,
      price: 220,
      category: FoodCategory.soups,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),

// Drinks
    Food(
      name: MenuStrings.limeWater,
      description: MenuStrings.limeWaterDescription,
      imagePath: MenuStrings.limeWaterImg,
      price: 100,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
  ];

  // user cart
  List<CartItem> _cart = [];

  // delivery address ( which user can change/update )
  String _deliveryAddress = 'Enter your address';

  // GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // CONSTRUCTOR
  Restaurant() {
    // Call a method to fetch and update the cart items when the class is instantiated
    getSavedCartItems();
  }

  // OPERATIONS

// add to cart

  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons

    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of the selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

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

    autoSaveCart();
    notifyListeners();
  }

  // save the cart to shared preferences
  void autoSaveCart() async {
    if (cart.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Convert each CartItem object into a Map
      List<Map<String, dynamic>> cartItemsJson =
          cart.map((item) => item.toJson()).toList();

      // Convert the list of Maps into a JSON string
      String cartItemsString = jsonEncode(cartItemsJson);

      // Save the JSON string to SharedPreferences
      prefs.setString('cartItems', cartItemsString);
    }
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

    autoSaveCart();
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

    autoClearCart();
    notifyListeners();
  }

  // remove the entry in shared preferences

  void autoClearCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartItems'); // removes specifically just the cartItems
  }

  // fetching the saved cart from shared preferences
  Future<void> getSavedCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cartItemsJson = prefs.getString('cartItems');

    if (cartItemsJson != null) {
      final List<dynamic> cartItemsData = jsonDecode(cartItemsJson);
      _cart = cartItemsData.map((data) => CartItem.fromJson(data)).toList();
    } else {
      _cart = []; // in case user clean installs the app
    }
  }

// update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
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
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');
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

// Food categories { slides, rice, noodles, dimsums, soups, sushi, drinks }
