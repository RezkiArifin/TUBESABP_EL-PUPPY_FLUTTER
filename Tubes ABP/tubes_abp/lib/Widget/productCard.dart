import 'package:flutter/material.dart';
import 'package:tubes_abp/model/product.dart';
import 'package:money_formatter/money_formatter.dart';
import '../Page/food.dart';
import '../theme.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({Key? key}) : super(key: key);
  final Product product;

  ProductCard(this.product);

  final priceFormat = new NumberFormat("#,##0.00", "en_US");
  // money/currency formater
  MoneyFormatter fmf = MoneyFormatter(
    amount: 30000
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(  
            context,  
            MaterialPageRoute(builder: (context) => FoodPages()),  
          );
      }, // Handle your callback
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
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
            Expanded(
              child: Center(
                child: Image.asset(product.imageUrl),
              ),
            ),
            Center(
              child: SizedBox(
                width: 80,
                height: 36,
                child: Text(product.name,
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
                Text(product.ratting.toString()
                  
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: "Rp. ").format(product.price)
            ),
          ]
        )
      ),
    );
  }
}