class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'quantity': quantity};
  }
}

class IceCream {
  final int id;
  final String name;
  final int price;
  final String flavor;
  final String image;
  final List<Ingredient> ingredients;

  IceCream({
    required this.id,
    required this.name,
    required this.price,
    required this.flavor,
    required this.image,
    required this.ingredients,
  });

  factory IceCream.fromJson(Map<String, dynamic> json) {
    return IceCream(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      flavor: json['flavor'],
      image: json['image'],
      ingredients:
          (json['ingredients'] as List)
              .map((e) => Ingredient.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'flavor': flavor,
      'image': image,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }
}

class IceCreamList {
  final List<IceCream> iceCreams;

  IceCreamList({required this.iceCreams});

  factory IceCreamList.fromJson(Map<String, dynamic> json) {
    return IceCreamList(
      iceCreams:
          (json['iceCreams'] as List).map((e) => IceCream.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'iceCreams': iceCreams.map((e) => e.toJson()).toList()};
  }
}
