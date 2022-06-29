import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/notif_model.dart';
import '../theme.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  Stream<List<notif>> getNotif() => FirebaseFirestore.instance
      .collection("notif")
      .snapshots()
      .map((event) => event.docs.map((e) => notif.fromJson(e.data())).toList());

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
            "Notifikasi",
            style: pageTitle,
          ),
        ),
        body: StreamBuilder<List<notif>>(
            stream: getNotif(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final notif = snapshot.data;
                return ListView.builder(
                  itemBuilder: (contect, index) {
                    return ListTile(
                      leading:
                          Image(image: NetworkImage(notif![index].image_url!)),
                      title: Text(notif[index].user!),
                      subtitle: Text("pesan: ${notif[index].pesan}"),
                    );
                  },
                  itemCount: notif!.length,
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
