class products {
  int? id;
  String? name;
  String? description;
  int? price;
  String? imageUrl;
  Null? createdAt;
  Null? updatedAt;

  products({this.id,
      this.name,
      this.description,
      this.price,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  factory products.fromJson(dynamic json) {
    return products(
      id : json['id'],
    name : json['name'],
    description : json['description'],
    price : json['price'],
    imageUrl : json['image_url'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'price' : price,
    'image_url' : imageUrl,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
  };
}
