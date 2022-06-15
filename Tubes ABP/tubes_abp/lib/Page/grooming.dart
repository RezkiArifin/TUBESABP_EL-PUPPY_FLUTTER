import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Grooming extends StatelessWidget {
  const Grooming({Key? key}) : super(key: key);

  final String url = 'http://127.0.0.1:8000/api/products';
  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
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
          ),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: (snapshot.data as dynamic)['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Image.network((snapshot.data as dynamic)['data']['image_url']),
                            Text((snapshot.data as dynamic)['data'][index]['name']),
                            // Text((snapshot.data as dynamic)['data'][index]['price'])
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('data error');
            }
          },
        ));
  }
}
