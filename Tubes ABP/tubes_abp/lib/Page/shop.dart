import 'package:flutter/material.dart';
import 'package:layout_grid/layout_grid.dart';
import 'package:provider/provider.dart';
import '../Widget/productCard.dart';
import '../model/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var productProvider = Provider.of<ProductProvider>(context);

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
            return LayoutGrid.count(
              crossAxisCount: orientation == Orientation.portrait? 2: 3,

              mainAxisSpacing: 4,
              crossAxisSpacing: 4,

              children: [
                ProductCard( Product(
                  id: 1, 
                  name: 'Whiskas Dry Adult 480 gr', 
                  imageUrl: 'assets/popular1.png', 
                  ratting: 4.8 , 
                  price: 30000
                )),
                ProductCard( Product(
                  id: 2, 
                  name: 'Dog Choize Adult 20 Kg', 
                  imageUrl: 'assets/popular2.png', 
                  ratting: 4.6 , 
                  price: 210000
                )),
                ProductCard( Product(
                  id: 3, 
                  name: 'Goats Milk Esbilac 340gr', 
                  imageUrl: 'assets/goatsmilk.png', 
                  ratting: 4.0 , 
                  price: 128000
                )),
                ProductCard( Product(
                  id: 1, 
                  name: 'Whiskas Dry Adult 480 gr', 
                  imageUrl: 'assets/popular1.png', 
                  ratting: 4.8 , 
                  price: 30000
                )),
                ProductCard( Product(
                  id: 2, 
                  name: 'Dog Choize Adult 20 Kg', 
                  imageUrl: 'assets/popular2.png', 
                  ratting: 4.6 , 
                  price: 210000
                )),
                ProductCard( Product(
                  id: 3, 
                  name: 'Goats Milk Esbilac 340gr', 
                  imageUrl: 'assets/goatsmilk.png', 
                  ratting: 4.0 , 
                  price: 128000
                )),
                ProductCard( Product(
                  id: 1, 
                  name: 'Whiskas Dry Adult 480 gr', 
                  imageUrl: 'assets/popular1.png', 
                  ratting: 4.8 , 
                  price: 30000
                )),
                ProductCard( Product(
                  id: 2, 
                  name: 'Dog Choize Adult 20 Kg', 
                  imageUrl: 'assets/popular2.png', 
                  ratting: 4.6 , 
                  price: 210000
                )),
                ProductCard( Product(
                  id: 3, 
                  name: 'Goats Milk Esbilac 340gr', 
                  imageUrl: 'assets/goatsmilk.png', 
                  ratting: 4.0 , 
                  price: 128000
                )),
              ],
            );
          } ),
        )
      );
  }
}