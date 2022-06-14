class Category{
  int id;
  String name;
  String imageIcon;

  Category({required this.id, required this.name, required this.imageIcon});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'], 
      name: json['name'] , 
      imageIcon: json['imageIcon']
      );
  }
}