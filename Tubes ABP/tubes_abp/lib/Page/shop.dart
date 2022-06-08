import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/food.dart';
import 'package:tubes_abp/Page/food2.dart';
import '../theme.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
              width: 390,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search Item',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
        ),
      ),
      body:GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodPages()),
                );
              },
              child: CustomCard(
                title: "Whiskas Dry Adult 480 gr",
                text: "Rp. 30.000", 
                image: "assets/popular1.png",
              )
              
              ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FoodPages2()),
              );
            },
            child: CustomCard(
                title: "Dog Choize Adult 20 Kg",
                text:"Rp. 210.000", 
                image:"assets/popular2.png"
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FoodPages()),
              );
            },
            child: CustomCard(
                title: "Goats Milk Esbilac 340gr",
                text:"Rp. 128.000", 
                image:
                    "assets/goatsmilk.png"),
          ),
          CustomCard(
              title: "Judul Card Kelima",
              text:"" , 
              image:
                  "https://cdn.pixabay.com/photo/2016/09/18/23/23/sugarloaf-mountain-1679285__340.jpg"),
        ],
      ),
    );
  }
}

//membuat customcard yang bisa kita panggil setiap kali dibutuhkan
class CustomCard extends StatelessWidget {
  //ini adalah konstruktor, saat class dipanggil parameter konstruktor wajib diisi
  //parameter ini akan mengisi title dan gambar pada setiap card
  CustomCard({required this.title, required this.text, required this.image});

  String title;
  String text;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        //menambahkan bayangan
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.contain
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Column(
                  children: [
                    Text(title,
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(text,
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
              
            )
          ],
        ),
      ),
    );
  }
}
