import 'package:flutter/material.dart';

import '../theme.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
          );
  }
}