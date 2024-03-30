class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;

  List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons});

  // to handle the shared preferences
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'category': category.toString().split('.').last, // Convert enum to string
      'availableAddons':
          availableAddons.map((addon) => addon.toJson()).toList(),
    };
  }

  // to convert back from shared preferences data
  // Define a fromJson method to parse JSON data into a Food object
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      description: json['description'],
      imagePath: json['imagePath'],
      price: json['price'],
      category: FoodCategory.values.firstWhere(
          (e) => e.toString() == 'FoodCategory.${json['category']}'),
      availableAddons: List<Addon>.from(json['availableAddons']
          .map((addonJson) => Addon.fromJson(addonJson))),
    );
  }
}

// Food categories
enum FoodCategory { slides, rice, noodles, dimsums, soups, drinks }

// Food Add ons

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });

  // to handle the shared preferences
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }

  // Define a fromJson factory constructor to parse JSON data into an Addon object
  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      name: json['name'],
      price: json['price'],
    );
  }
}
