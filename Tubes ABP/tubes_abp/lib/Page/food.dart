import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/order_produk.dart';
import 'package:tubes_abp/Widget/RattingDanUlasan.dart';
import '../theme.dart';

class FoodPages extends StatelessWidget {
  const FoodPages({Key? key}) : super(key: key);

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
                  image: DecorationImage(image: AssetImage('assets/food1.png'), fit: BoxFit.cover)
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
                        "Whiskas Dry Adult 480 gr",
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
                  "RP 30.000",
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
                  "WHISKAS makanan kucing lengkap dan seimbang, dirancang khusus untuk memenuhi kebutuhan kucing Anda pada tahap kehidupan mereka.",
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
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/3),
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    // border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    children: [
                      RattingDanUlasan(),
                      RattingDanUlasan(),
                      RattingDanUlasan(),
                      RattingDanUlasan(),
                      RattingDanUlasan(),
                      RattingDanUlasan(),
                      RattingDanUlasan(),

                    ],
                  ),
                ),
              ),
              // Divider(color: Color(0xfffBBBBBB),
              // thickness: 1,
              // ),
            ],
          ),
        ),

      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.zero,
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Harga",
                  style: rating,
                ),
                Text(
                  "RP 30.000",
                  style: TotalHarga,
                )
              ],
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => OrderProduct()),  
              );
            }, 
            child: Text(
              "Order",
              style: OrderButton,
              ), 
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xfffE5561C)
            )),
            ),
          ],
        ),
        ),
      ],
      
    );
  }
}
