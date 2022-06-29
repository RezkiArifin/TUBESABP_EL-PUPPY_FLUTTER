import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Page/order_produk.dart';
import '../model/orders_model.dart';
import '../theme.dart';
import 'package:tubes_abp/Page/order_produk.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Stream<List<orders>> getOrder() =>
      FirebaseFirestore.instance.collection("orders").snapshots().map(
          (event) => event.docs.map((e) => orders.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<List<orders>>(
            stream: getOrder(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final groom = snapshot.data;
                return ListView.builder(
                  itemBuilder: (contect, index) {
                    return Container(
                        child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Text(groom![index].produk!,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Jumlah : ${groom[index].jumlah}",
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Alamat : ${groom[index].alamat}",
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left),
                        ],
                      ),
                    )
                        // Text(groom![index].produk!),
                        // Text(groom[index].jumlah!),
                        // Text(groom[index].alamat!),
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
