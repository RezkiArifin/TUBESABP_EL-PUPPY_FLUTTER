import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/orders_model.dart';
import '../theme.dart';
import 'package:tubes_abp/Page/alamat.dart';

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
                    return ListTile(
                      leading: Text(groom![index].produk!),
                      title: Text(groom[index].jumlah!),
                      subtitle: Text(groom[index].alamat!),
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
