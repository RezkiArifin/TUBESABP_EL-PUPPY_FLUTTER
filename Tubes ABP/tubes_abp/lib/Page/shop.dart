import 'package:flutter/material.dart';
import 'package:layout_grid/layout_grid.dart';
import 'package:provider/provider.dart';

import '../Widget/productCard.dart';
import '../model/product.dart';
import '../provider/Product_provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {

            return FutureBuilder(
              future: productProvider.getProductList(),
              builder: (context, snapshot){
                if (snapshot.hasData){
                  List <Product> data = snapshot.data as List<Product>;

                  int index = 0;

                  return LayoutGrid.count(
                    crossAxisCount: orientation == Orientation.portrait? 2: 3,
                          
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                          
                    children: data.map((item){
                      index++;
                      return ProductCard(item);
                    }).toList()

                    // [
                      
                    //   ProductCard( Product(
                    //     id: 1, 
                    //     name: 'Whiskas Dry Adult 480 gr', 
                    //     imageUrl: 'assets/popular1.png', 
                    //     ratting: 4.8 , 
                    //     price: 30000
                    //   )),
                      
                    // ],
                  );
                }
                return const Center(child: CircularProgressIndicator(),);
              },
            
            );
          } ),
        )
      );
  }
}