import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/food.dart';
import 'package:tubes_abp/Page/food2.dart';
import 'package:tubes_abp/Page/grooming.dart';
import 'package:tubes_abp/Page/shop.dart';
import 'package:tubes_abp/Widget/category_card.dart';
import 'package:tubes_abp/Widget/discountCard.dart';
import 'package:tubes_abp/Widget/productCard.dart';
import 'package:tubes_abp/model/Category.dart';
import 'package:tubes_abp/model/product.dart';
import '../theme.dart';

class BarHome extends StatefulWidget {
  const BarHome({Key? key}) : super(key: key);

  @override
  State<BarHome> createState() => _BarHome();
}

class _BarHome extends State<BarHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(
            width: 390,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
                height: 24,
              ),
            
            // Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              
              ),
              
              // see all category
              // ignore: unnecessary_new
              new GestureDetector(
                onTap: () {},
                child: const Text('See All',
                  style: TextStyle(
                    color: Color(0xffE5561C),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
                height: 12,
              ),
          
          // fiture list 
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(Category(
                  id: 1, 
                  name: "Food", 
                  imageIcon: 'assets/tulang.png'
                  )),
                const SizedBox(
                  width: 10,
                ),

                CategoryCard(Category(
                  id: 2, 
                  name: "Clinic", 
                  imageIcon: 'assets/klinik.png'
                  )),
                
                const SizedBox(
                  width: 10,
                ),

                CategoryCard(Category(
                  id: 2, 
                  name: 'Grooming', 
                  imageIcon: 'assets/grooming.png'
                )),
              ],
            ),
          ),

          // end fiture list
          const SizedBox(
                height: 24,
          ),

          // adsense/discount card
          Text('Promo',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
                height: 12,
          ),
          // memanggil discount card
          DiscountCard(),

          const SizedBox(
                height: 24,
          ),

          // popular product
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Product',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              
              ),

              // ignore: unnecessary_new
              new GestureDetector(
                onTap: () {
                  Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => const ShopPage(),  
                        ),
                      );
                },
                child: const Text('See All',
                  style: TextStyle(
                    color: Color(0xffE5561C),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
                height: 12,
          ),
          
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,

              // popular product list
              children: [
                ProductCard( Product(
                  id: 1, 
                  name: 'Whiskas Dry Adult 480 gr', 
                  imageUrl: 'assets/popular1.png', 
                  ratting: 4.8 , 
                  price: 30000
                )),
                const SizedBox(
                    width: 32,
                ),
                ProductCard( Product(
                  id: 2, 
                  name: 'Dog Choize Adult 20 Kg', 
                  imageUrl: 'assets/popular2.png', 
                  ratting: 4.6 , 
                  price: 210000
                )),
                const SizedBox(
                    width: 32,
                ),

                ProductCard( Product(
                  id: 3, 
                  name: 'Goats Milk Esbilac 340gr', 
                  imageUrl: 'assets/goatsmilk.png', 
                  ratting: 4.0 , 
                  price: 128000
                )),
                
              ]
            ),
          ),
        ],
      ),
    );
  }
}
