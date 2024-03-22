import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/cart_item.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

// Food categories { slides, rice, noodles, dimsums, soups, sushi, drinks }

  final List<Food> _menu = [
    // slides
    Food(
        name: MenuStrings.paneerChiliDry,
        description:
            'Cottage cheese, chillies, bell peppers, completely hawker style',
        imagePath: MenuStrings.paneerChiliDryImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Extra Paneer', price: 50),
        ]),
    Food(
        name: MenuStrings.springRolls,
        description:
            'Crispy rolls filled with vegetables, bean sprouts, glass noodles, spices with sweet chilli dip',
        imagePath: MenuStrings.springRollsImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 30),
        ]),
    Food(
        name: MenuStrings.vegManchurianDry,
        description:
            'Minced vegetable manchurian ball in soya chillI sauce & coriander',
        imagePath: MenuStrings.vegManchurianDryImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 30),
        ]),
    Food(
        name: MenuStrings.edamame,
        description:
            'Edamame, smoked chilies, roast garlic, Himalayan pink salt',
        imagePath: MenuStrings.edamameImg,
        price: 450,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name: 'Chili Garlic Sauce', price: 50),
        ]),
    Food(
        name: MenuStrings.tacos,
        description: 'Taco shells, shiitake mushrooms, vegetables, sweet basil',
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
        description: 'Roast chilli and garlic fried rice',
        imagePath: MenuStrings.chiliGarlicFriedRiceImg,
        price: 400,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.japaneseFriedRice,
        description: 'Sticky rice, shiitake, spring onion',
        imagePath: MenuStrings.japaneseFriedRiceImg,
        price: 295,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.kimchiFriedRice,
        description: 'Korean spiced fried rice with kimchi',
        imagePath: MenuStrings.kimchiFriedRiceImg,
        price: 310,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),
    Food(
        name: MenuStrings.vegWokTossedRice,
        description: 'Wok tossed rice with veg',
        imagePath: MenuStrings.vegWokTossedRiceImg,
        price: 310,
        category: FoodCategory.rice,
        availableAddons: [
          Addon(name: 'Lime Water', price: 100),
        ]),

    // Noodles
    Food(
      name: MenuStrings.chiliGarlicNoodles,
      description: 'Fiery freshly made noodles with roast garlic & chilli',
      imagePath: MenuStrings.chiliGarlicNoodlesImg,
      price: 250,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.hakkaNoodles,
      description: 'Simply hakka freshly made noodles',
      imagePath: MenuStrings.hakkaNoodlesImg,
      price: 270,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.padThaiNoodles,
      description: 'Quintessential Thai flat noodles made the Thai hawker way',
      imagePath: MenuStrings.padThaiNoodlesImg,
      price: 290,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.soggyNoodles,
      description: 'Slightly wet wok cooked freshly made noodles',
      imagePath: MenuStrings.soggyNoodlesImg,
      price: 310,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.teppanyakiNoodles,
      description: 'Cooked Japanese way teppanyaki style',
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
      description: 'Beetroot with herbs dumplings',
      imagePath: MenuStrings.beetrootDumplingsImg,
      price: 220,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.pattayaDimsums,
      description: 'Shredded greens, kaffir lime leaves, dumplings',
      imagePath: MenuStrings.pattayaDimsumsImg,
      price: 240,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.hunanMushrooms,
      description: 'Assorted mushrooms with hoisin & ginger (6 Pieces)',
      imagePath: MenuStrings.hunanMushroomsImg,
      price: 260,
      category: FoodCategory.dimsums,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.basilChicken,
      description: 'Chicken dumplings with sweet basil, chilli & Thai herbs',
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
      description: 'Wontons, vegetables, clear broth',
      imagePath: MenuStrings.vegChineseWontonsImg,
      price: 180,
      category: FoodCategory.soups,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.vegHotAndSour,
      description: 'Shredded vegetables, tofu, pepper, premium soya sauce',
      imagePath: MenuStrings.vegHotAndSourImg,
      price: 200,
      category: FoodCategory.soups,
      availableAddons: [
        Addon(name: 'Lime Water', price: 100),
      ],
    ),
    Food(
      name: MenuStrings.vegKhaoSueySoup,
      description:
          'Burmese coconut broth with freshly made noodles and vegetables',
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
      description: 'Refreshing lime juice drink with shikanji masala',
      imagePath: MenuStrings.limeWaterImg,
      price: 100,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address ( which user can change/update )
  String _deliveryAddress = 'Enter your address';

  // GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

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

class MenuStrings {
  // names and image  paths

  // slides
  static const String paneerChiliDry = 'Paneer Chili Dry';
  static const String paneerChiliDryImg =
      'assets/images/slides/paneerChiliDry.jpg';
  static const String springRolls = 'Spring Rolls';
  static const String springRollsImg = 'assets/images/slides/springRolls.jpg';
  static const String vegManchurianDry = 'Veg Manchurian Dry';
  static const String vegManchurianDryImg =
      'assets/images/slides/vegManchurianDry.jpg';
  static const String edamame = 'Edamame';
  static const String edamameImg = 'assets/images/slides/edamame.jpg';
  static const String tacos = 'Tacos';
  static const String tacosImg = 'assets/images/slides/tacos.jpg';

  // rice
  static const String chiliGarlicFriedRice = 'Chili Garlic Fried Rice';
  static const String chiliGarlicFriedRiceImg =
      'assets/images/rice/chiliGarlicFriedRice.jpg';
  static const String japaneseFriedRice = 'Japanese Fried Rice';
  static const String japaneseFriedRiceImg =
      'assets/images/rice/japaneseFriedRice.jpg';
  static const String kimchiFriedRice = 'Kimchi Fried Rice';
  static const String kimchiFriedRiceImg =
      'assets/images/rice/kimchiFriedRice.jpg';
  static const String vegWokTossedRice = 'Veg Wok Tossed Rice';
  static const String vegWokTossedRiceImg =
      'assets/images/rice/vegWokTossedRice.jpg';

  // noodles

  static const String chiliGarlicNoodles = 'Chili Garlic Noodles';
  static const String chiliGarlicNoodlesImg =
      'assets/images/noodles/chiliGarlicNoodles.jpg';
  static const String hakkaNoodles = 'Hakka Noodles';
  static const String hakkaNoodlesImg =
      'assets/images/noodles/hakkaNoodles.jpg';
  static const String padThaiNoodles = 'Pad Thai Noodles';
  static const String padThaiNoodlesImg =
      'assets/images/noodles/padThaiNoodles.jpg';
  static const String soggyNoodles = 'Soggy Noodles';
  static const String soggyNoodlesImg =
      'assets/images/noodles/soggyNoodles.jpg';
  static const String teppanyakiNoodles = 'Teppanyaki Noodles';
  static const String teppanyakiNoodlesImg =
      'assets/images/noodles/teppanyakiNoodles.jpg';

  // dimsums

  static const String beetrootDumplings = 'Beetroot Dumplings';
  static const String beetrootDumplingsImg =
      'assets/images/dimsums/beetrootDumplings.jpg';
  static const String pattayaDimsums = 'Pattaya Dimsums';
  static const String pattayaDimsumsImg =
      'assets/images/dimsums/pattayaDimsums.jpg';
  static const String hunanMushrooms = 'Hunan Mushrooms';
  static const String hunanMushroomsImg =
      'assets/images/dimsums/hunanMushrooms.jpg';
  static const String basilChicken = 'Basil Chicken';
  static const String basilChickenImg =
      'assets/images/dimsums/basilChicken.jpg';

  // soups

  static const String vegChineseWontons = 'Veg Chinese Wontons';
  static const String vegChineseWontonsImg =
      'assets/images/soups/vegChineseWontons.jpg';
  static const String vegHotAndSour = 'Veg Hot and Sour';
  static const String vegHotAndSourImg =
      'assets/images/soups/vegHotAndSour.jpg';
  static const String vegKhaoSueySoup = 'Veg Khao Suey Soup';
  static const String vegKhaoSueySoupImg =
      'assets/images/soups/vegKhaoSueySoup.jpg';

  // drinks

  static const String limeWater = 'Lime Water';
  static const String limeWaterImg = 'assets/images/drinks/limeWater.jpg';
}
