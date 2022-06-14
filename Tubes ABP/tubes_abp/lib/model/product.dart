class Product{
  int id;
  String name;
  String imageUrl;
  double ratting;
  double price;

  Product({required this.id, required this.name, required this.imageUrl, required this.ratting, required this.price});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      ratting: json['ratting'],
      price: json['price']
    );
  }
}