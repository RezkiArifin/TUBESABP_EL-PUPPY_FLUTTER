import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/klinik_model.dart';
import '../theme.dart';

class Klinik extends StatefulWidget {
  const Klinik({Key? key}) : super(key: key);

  @override
  State<Klinik> createState() => _KlinikState();
}

class _KlinikState extends State<Klinik> {
  Stream<List<klinik>> getGroomings() => FirebaseFirestore.instance.collection("klinik").snapshots().map((event) => event.docs.map((e) => klinik.fromJson(e.data())).toList());

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
            "Klinik",
            style: pageTitle,
          ),
        ),
        body: StreamBuilder<List<klinik>>(
          stream: getGroomings(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            final groom = snapshot.data;
            return ListView.builder(itemBuilder: (contect, index) {
              return ListTile(
                leading: Image(image: NetworkImage(groom![index].imageUrl!)),
                title: Text(groom[index].name!),
                // subtitle: Text("Deskripsi: ${groom[index].description}", maxLines: 3, overflow: TextOverflow.ellipsis,),
        
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