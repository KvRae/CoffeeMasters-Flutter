import 'datamodel.dart';

class DataManager {
  List<Category>? _menu;
  List<ItemCart> cart = [] ;

  cartAdd(Product p){
    bool found = false ;
    for (var item in cart){
      if (p.id == item.product.id){
        item.quantity++;
        found = true;
      }
      if(!found){
        cart.add(ItemCart(product: p, quantity: 1));
      }
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
}