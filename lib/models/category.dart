class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}

final List<Category> categories = [
  Category(id: '1', name: 'Electronics'),
  Category(id: '2', name: 'Fashion'),
  Category(id: '3', name: 'Home & Garden'),
  Category(id: '4', name: 'Sports & Outdoors'),
  Category(id: '5', name: 'Toys & Games'),
];