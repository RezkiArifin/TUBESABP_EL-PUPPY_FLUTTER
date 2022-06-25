class klinik {
  int? id;
  String? name;
  int? price;
  String? imageUrl;
  Null? createdAt;
  Null? updatedAt;

  klinik({this.id,
      this.name,
      this.price,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  factory klinik.fromJson(dynamic json) {
    return klinik(
      id : json['id'],
    name : json['name'],
    price : json['price'],
    imageUrl : json['image_url'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'price' : price,
    'image_url' : imageUrl,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
  };
}
