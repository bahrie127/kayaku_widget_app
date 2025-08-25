class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, price: $price, imageUrl: $imageUrl)';
  }
}

// Sample list of products 20
List<ProductModel> products = List.generate(
  20,
  (index) => ProductModel(
    name: 'Product $index',
    description: 'Description of Product $index',
    price: 10.0 + index * 2.5, // Price increases by 2.5 for each product
    imageUrl: 'https://i.pravatar.cc/${300 + index}', // Placeholder URL
  ),
);
