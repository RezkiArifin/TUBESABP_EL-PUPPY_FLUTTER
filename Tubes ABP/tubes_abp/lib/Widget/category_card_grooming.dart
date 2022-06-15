import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/grooming.dart';
import 'package:tubes_abp/model/Category.dart';

class CategoryCardGrooming extends StatelessWidget {
  // const CategoryCard({Key? key}) : super(key: key);

  // memanggil model Category
  final Category category;
  const CategoryCardGrooming(this.category);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(  
            context,  
            MaterialPageRoute(builder: (context) => const Grooming(),  
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

    // horizontal fitur list
    child: Row(
      children: [
        Image.asset( category.imageIcon, 
        width: 24, 
        height: 24,),
        SizedBox(
          width: 8,
        ),
        Text(category.name)
      ],
    ),
    ),
    );
  }
}