import 'package:flutter/material.dart';
import '../theme.dart';

class RattingDanUlasan extends StatelessWidget {
  const RattingDanUlasan({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('bilal.png'),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bilal Dhafin',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        const Text('16/02/2022')
                      ],
                    ),
                  ],
                ),
            
                Row(
                  children: const <Widget>[
                    Icon(Icons.star_outlined,
                      color: Color(0xffE5D646),
                    ),
                    Icon(Icons.star_outlined,
                      color: Color(0xffE5D646),
                    ),
                    Icon(Icons.star_outlined,
                      color: Color(0xffE5D646),
                    ),
                    Icon(Icons.star_outlined,
                      color: Color(0xffE5D646),
                    ),
                    Icon(Icons.star_outlined,
                      color: Color(0xffE5D646),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Text('Aplikasi yang sangat membantu saya belanja kebutuhan hewan peliharaan saya',
            style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w300
            )
            ),
          ],
        ),
      ),
    );
  }
}