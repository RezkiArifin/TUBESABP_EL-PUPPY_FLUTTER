class klinik {
  int? id;
  String? name;
  int? price;
  String? description;
  String? imageUrl;
  Null? createdAt;
  Null? updatedAt;

  klinik(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  factory klinik.fromJson(dynamic json) {
    return klinik(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        imageUrl: json['image_url'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'image_url': imageUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
