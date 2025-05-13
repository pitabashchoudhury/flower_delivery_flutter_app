import 'package:phul_ecom_partner/data/model/add_cart_model.dart';

class AddToCartPrice {
  static int totalPrice(List<Carting> carts) {
    int price = 0;
    for (var element in carts) {
      price = price + element.totalAmount;
    }
    return price;
  }
}
