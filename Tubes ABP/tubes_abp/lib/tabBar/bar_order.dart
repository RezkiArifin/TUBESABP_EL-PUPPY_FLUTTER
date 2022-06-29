import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Page/alamat.dart';
import '../model/order_model.dart';
import '../theme.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Stream<List<order>> getGroomings() => FirebaseFirestore.instance
      .collection("order")
      .snapshots()
      .map((event) => event.docs.map((e) => order.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<List<order>>(
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
                              child: Text(groom![index].produk!),

                              // title: Text(groom[index].name!),
                              // subtitle: Text("Harga: ${groom[index].price}"),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    groom[index].produk!,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Harga: ${groom[index].jumlah}",
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
                                      "${groom[index].alamat}",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
