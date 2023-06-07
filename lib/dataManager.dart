import 'dart:convert';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemCart> cart = [] ;

   cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (p.id == item.product.id) {
        item.quantity++;
        found = true;
        break;  // Exit the loop since the item is found
      }
    }
    if (!found) {
      cart.add(ItemCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p){
    cart.removeWhere((element) => element.product.id == p.id);
  }
  cartClear(){
    cart.clear();
  }

  double cartTottale(){
    var total = 0.0;
    for (var item in cart ){
      total += item.quantity * item.product.price  ;
    }
    return total ;
  }

  fetchMenu() async{
    const url ="https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var body = response.body;
      _menu = [];
      var decodedData = jsonDecode(body) as List<dynamic>;
      for (var json in decodedData){
        _menu?.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>?> getMenu() async{
    if(_menu == null){
      await fetchMenu();
    }
    return _menu ;
  }


}