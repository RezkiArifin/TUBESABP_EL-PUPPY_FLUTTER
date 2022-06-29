import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/products_model.dart';
import '../theme.dart';
import 'alamat.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Stream<List<products>> getGroomings() => FirebaseFirestore.instance
      .collection("products")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => products.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<List<products>>(
            stream: getGroomings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final groom = snapshot.data;
                return ListView.builder(
                  itemBuilder: (contect, index) {
                    return Container(
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              child: Image(
                                  image: NetworkImage(groom![index].imageUrl!),
                                  fit: BoxFit.cover),

                              // title: Text(groom[index].name!),
                              // subtitle: Text("Harga: ${groom[index].price}"),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    groom[index].name!,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Harga: ${groom[index].price}",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "${groom[index].description}",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60, right: 16),
                              child: ElevatedButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(229, 233, 78, 39)),
                                  child: const Text('Book'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Alamat()),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: groom!.length,
                );
              } else if (snapshot.hasError) {
                return Text('Error');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
