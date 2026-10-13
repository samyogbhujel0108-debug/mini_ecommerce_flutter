
class Product {
  final String name;
  final String category;
  final String image; // image URL
  final double price;
  final double rating;
  final String description;
  final int discount;
  final bool isNew;

  Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.discount = 0,
    this.isNew = false,
  });
}
