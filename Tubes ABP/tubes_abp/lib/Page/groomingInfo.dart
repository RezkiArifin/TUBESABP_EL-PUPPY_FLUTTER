import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/food.dart';
import 'package:tubes_abp/Widget/RattingDanUlasan.dart';
import '../theme.dart';

class GroomingPages extends StatelessWidget {
  const GroomingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black,),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Grooming Info", 
        style: pageTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('grooming2.png'), fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Pet Bathing",
                        style: productTitle,
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right : 20),
                      child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_rounded, size: 24,),
                      color: Color(0xfffF43539),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 24, color: Color(0xfffD2D608),),
                    SizedBox(width: 5,),
                    Text(
                      "4.8",
                      style: rating,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: Text(
                  "RP 64.000",
                  style: rating,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Description",
                  style: productTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Text(
                  "Pada proses grooming ini, seluruh badan hewan peliharaan anda akan dibasahi dengan air hangat secara merata.",
                  style: deskripsi,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Rating dan Ulasan",
                  style: productTitle,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 26),
                child: Container(
                  height: 114,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(2, 4), 
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      RattingDanUlasan(),
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0xfffBBBBBB),
              thickness: 1,
              ),
              Container(
                height: 85,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 0, 4),
                        child: Text(
                          "Total Harga",
                          style: rating,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 12),
                        child: Text(
                          "RP 64.000",
                          style: TotalHarga,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FoodPages()),
                      );
                    }, 
                    child: Text(
                      "Order",
                      style: OrderButton,
                      ), 
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xfffE5561C)
                    )),
                    ),
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
    );
  }
}
