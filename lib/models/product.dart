class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imagePath;
  final String category;
  final bool isFavorite;
  final List<String> features;
  final String brand;
  final String model;
  final Map<String, String> specifications;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.category,
    this.isFavorite = false,
    required this.features,
    required this.brand,
    required this.model,
    required this.specifications,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? rating,
    String? imagePath,
    String? category,
    bool? isFavorite,
    List<String>? features,
    String? brand,
    String? model,
    Map<String, String>? specifications,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      features: features ?? this.features,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      specifications: specifications ?? this.specifications,
    );
  }
}
