import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_abp/model/RattingDanUlasan_model.dart';

class RattingDanUlasanProvider extends ChangeNotifier{
  getProductList() async {
    // var result = await http.get(Uri.parse('linkAPI'));
    var result = await http.get(Uri.parse('linkAPI'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200){
      List data = jsonDecode(result.body);
      List<RattingDanUlasan> ulasan = data.map((item) => RattingDanUlasan.fromJson(item)).toList();
      return ulasan;
    } else {
      return <RattingDanUlasan>[];
    }
  }
}
