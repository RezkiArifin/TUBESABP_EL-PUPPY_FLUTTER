import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/products_model.dart';
import '../theme.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // final String url = 'http://127.0.0.1:8000/api/products';

  // final Dio dio = Dio();
  // List listgrooming = [];

  // getProducts() async {
  //   var response = await dio.get(url);
  //   print("dataV = ${response.statusCode}");
  //   var gromming = response.data as List;
  //   List<grooming> groomingList =
  //       gromming.map((e) => grooming.fromJson(e)).toList();

  //   return groomingList;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getProducts();
  // }

  Stream<List<products>> getGroomings() => FirebaseFirestore.instance.collection("products").snapshots().map((event) => event.docs.map((e) => products.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Product",
            style: pageTitle,
          ),
        ),
        body: StreamBuilder<List<products>>(
          stream: getGroomings(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            final groom = snapshot.data;
            return ListView.builder(itemBuilder: (contect, index) {
              return ListTile(
                leading: Image(image: NetworkImage(groom![index].imageUrl!)),
                title: Text(groom[index].name!),
                subtitle: Text("Harga: ${groom[index].price}"),

              );
            }, itemCount: groom!.length,);
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        }));
  }
}
