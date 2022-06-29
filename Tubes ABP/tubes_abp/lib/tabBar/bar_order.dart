import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tubes_abp/model/order_model.dart';

import '../theme.dart';

class BarOrder extends StatefulWidget {
  const BarOrder({Key? key}) : super(key: key);

  @override
  State<BarOrder> createState() => _BarOrder();
}

class _BarOrder extends State<BarOrder> {
  Stream<List<order>> getGroomings() => FirebaseFirestore.instance
      .collection("order")
      .snapshots()
      .map((event) => event.docs.map((e) => order.fromJson(e.data())).toList());
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
        body: StreamBuilder<List<order>>(
            stream: getGroomings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final groom = snapshot.data as dynamic;
                return ListView.builder(
                  itemBuilder: (contect, index) {
                    return ListTile(
                      leading:
                          Image(image: NetworkImage(groom![index].produk!)),
                      title: Text(groom[index].produk!),
                      subtitle: Text("Harga: ${groom[index].alamat}"),
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
