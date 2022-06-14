import 'dart:convert';

class RattingDanUlasan{
  int id;
  String name;
  String comment;
  String time_comment;
  String imageProfileURL; 
  RattingDanUlasan({required this.id , required this.imageProfileURL, required this.name, required this.comment, required this.time_comment});

  factory RattingDanUlasan.fromJson(Map<String, dynamic> json){
    return RattingDanUlasan(
      id: json['id'] , 
      imageProfileURL: json['imageProfileURL'] , 
      name: json['name'] , 
      comment: json['comment'] , 
      time_comment: json['time_comment'] 
      );
  }
}