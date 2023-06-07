import 'package:coffee_masters/dataManager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager  ;
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
      future: dataManager.getMenu(),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            // The Future has finished , data is here
            var categories = snapshot.data! as List<Category>;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(categories[index].name),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: categories[index].products.length,
                      itemBuilder: (context, prodIndex) {
                        var product = categories[index].products[prodIndex];
                        return ProductItem(
                            product: product,
                            onAdd: (addedProduct){
                              print(addedProduct.name);
                              dataManager.cartAdd(addedProduct);
                              print(dataManager.cart.length);
                        });
                      }
                  )
                ],
              );
            },
            );

          }else if (snapshot.hasError){
            // Data is not there, has an error
            return Center(child: const Text("There was an error"));
          }
          else{
            // Data is not there (Future is in progress)
            return Center(child: const CircularProgressIndicator());
          }
    })
    );
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
            Image.network(product.imageUrl),
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
                      child: Text("\$" +product.price.toStringAsFixed(2)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                      onPressed: (){
                        // Show a snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added ${product.name} to cart"),
                              duration: Duration(seconds: 1),
                            )
                        );
                        onAdd(product);
                        },
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

