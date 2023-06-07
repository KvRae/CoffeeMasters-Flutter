import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Product(id: 1, name: "Dummy Product", price: 25, image: "image");
    var q = Product(id: 2, name: "Dummy Product but diffrenet", price: 25, image: "image");
    return ListView(children:[
    ProductItem(product: p, onAdd: (){},),
    ProductItem(product: q, onAdd: (){})
    ]);
  }
}

class ProductItem extends StatelessWidget {

  final Product product ;
  final Function onAdd;

  const ProductItem({Key? key, required this.product, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png",fit: BoxFit.fitWidth),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.name
                        ,style: TextStyle(fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.price.toString()),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                      onPressed: (){onAdd(product);},
                      child: Text("Add")
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}

