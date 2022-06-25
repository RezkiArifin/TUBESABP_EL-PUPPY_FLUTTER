import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/history_model.dart';
import '../theme.dart';


// class History extends StatelessWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

// class _HistoryState extends State<History>
//   Stream<List<history>> getGroomings() => FirebaseFirestore.instance.collection("grooming").snapshots().map((event) => event.docs.map((e) => grooming.fromJson(e.data())).toList());


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Stream<List<history>> getGroomings() => FirebaseFirestore.instance.collection("History").snapshots().map((event) => event.docs.map((e) => history.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   iconTheme: IconThemeData(
        //     color: Colors.black,
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   title: Text(
        //     "History",
        //     style: pageTitle,
        //   ),
        // ),
        body: StreamBuilder<List<history>>(
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