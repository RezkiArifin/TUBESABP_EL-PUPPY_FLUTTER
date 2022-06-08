import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/alamat.dart';
import 'package:tubes_abp/Widget/RattingDanUlasan.dart';
import '../theme.dart';

class FoodPages2 extends StatelessWidget {
  const FoodPages2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black,),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Food Info", 
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
                  image: DecorationImage(image: AssetImage('food2.png'), fit: BoxFit.cover)
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
                        "Dog Choize Adult 20 Kg",
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
                      "4.6",
                      style: rating,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: Text(
                  "Rp. 210.000",
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
                  "Dog Choize Adult makanan anjing lengkap dan seimbang, dirancang khusus untuk memenuhi kebutuhan anjing Anda pada tahap dewasa mereka.",
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
                  width: 360,
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
                  child: ListView(
                    children: [
                      RattingDanUlasan()
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0xfffBBBBBB),
              thickness: 1,
              ),
              Container(
                height: 72,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 12, 0, 4),
                        child: Text(
                          "Total Harga",
                          style: rating,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 0, 12),
                        child: Text(
                          "RP 30.000",
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
                        MaterialPageRoute(builder: (context) => Alamat()),  
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
