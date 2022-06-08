import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/food.dart';
import 'package:tubes_abp/Page/food2.dart';
import 'package:tubes_abp/Page/grooming.dart';
import 'package:tubes_abp/Page/shop.dart';
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
          Row(
            children: [
              Text('Category',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              
              ),
              const SizedBox(
                width: 210,
              ),
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
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => const ShopPage(),  
                        ),
                      );
                  }, // Handle your callback
                  child: Ink(
                  height: 40,
                  width: 110,
                  decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                      BoxShadow(
                        color: Color(0xff00000 ),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(2, 4), // changes position of shadow
                      )
                    ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/tulang.png', width: 24, height: 24,),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Food')
                  ],
                ),
                ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {}, // Handle your callback
                  child: Ink(
                  height: 40,
                  width: 110,
                  decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                      BoxShadow(
                        color: Color(0xff00000 ),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(2, 4), // changes position of shadow
                      )
                    ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/klinik.png', width: 24, height: 24,),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Clinic')
                  ],
                ),
                ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => GroomingPages()),  
                      );
                  }, // Handle your callback
                  child: Ink(
                  height: 40,
                  width: 110,
                  decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                      BoxShadow(
                        color: Color(0xff00000 ),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(2, 4), // changes position of shadow
                      )
                    ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/grooming.png', width: 24, height: 24,),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Grooming')
                  ],
                ),
                ),
                ),
              ],
            ),
          ),
          const SizedBox(
                height: 24,
          ),
          Text('Promo',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
                height: 12,
          ),
          Container(
            height: 136,
            width: 320,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(       
              color: promoCardColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                  const BoxShadow(
                    color: Color(0xff00000 ),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(2, 4), // changes position of shadow
                  )
                ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 56,
                      width: 163,
                      child: Text('20% discount on kitten food.',
                        style: TextStyle(
                          color: Color(0xff494A4A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // ignore: unnecessary_new
                    new GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 32,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: orangeColor,
                        ),
                        child: const Center(
                          child: Text('See Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Image.asset('assets/kitty1.png'),
              ],
            ),   
          ),
          const SizedBox(
                height: 24,
          ),
          Row(
            children: [
              Text('Popular Product',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              
              ),
              const SizedBox(
                width: 150,
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
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => FoodPages()),  
                      );
                  }, // Handle your callback
                  child: Ink(
                  height: 200,
                  width: 144,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xff00000 ),    
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(2, 4), // changes position of shadow
                        )
                      ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/popular1.png'),
                      ),
                      Center(
                        child: SizedBox(
                          width: 80,
                          height: 36,
                          child: Text('Whiskas Dry Adult 480 gr',
                            style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined,
                                color: Color(0xffE5D646),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text('4,8'
                            
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text('Rp. 30.000'
                      )
                    ]
                  )
                ),
                ),
                const SizedBox(
                    width: 32,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FoodPages2())
                    );
                  }, // Handle your callback
                  child: Ink(
                  height: 200,
                  width: 144,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(
                          color: Color(0xff00000 ),    
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(2, 4), // changes position of shadow
                        )
                      ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/popular2.png'),
                      ),
                      Center(
                        child: SizedBox(
                          width: 80,
                          height: 36,
                          child: Text('Dog Choize Adult 20 Kg',
                            style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined,
                                color: Color(0xffE5D646),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text('4,6'
                            
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Rp. 210.000'
                      )
                    ]
                  )
                ),
                ),
                const SizedBox(
                    width: 32,
                ),
                InkWell(
                    onTap: () {}, // Handle your callback
                    child: Ink(
                    height: 200,
                    width: 144,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                          BoxShadow(
                            color: Color(0xff00000 ),    
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(2, 4), // changes position of shadow
                          )
                        ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset('assets/goatsmilk.png'),
                        ),
                        Center(
                          child: SizedBox(
                            width: 80,
                            height: 36,
                            child: Text('Goats Milk Esbilac 340gr',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_outlined,
                                  color: Color(0xffE5D646),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('4,0'
                              
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Rp. 128.000'
                        )
                      ]
                    )
                  ),
                  ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
