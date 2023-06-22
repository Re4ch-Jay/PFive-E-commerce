import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/models/product_model.dart';

class Cart extends ChangeNotifier {
  // user cart

  final List<ProductModel> _userCart = [];
  // get user cart

  List<ProductModel> get userCart => _userCart;

  // add item to cart

  void addItemToCart(ProductModel product) {
    _userCart.add(product);
    calculateAddPrice(product);
    notifyListeners();
  }

  // remove item from cart
  void removeItemToCart(ProductModel product) {
    _userCart.remove(product);
    calculateRemovePrice(product);
    notifyListeners();
  }

  // calculate price
  double totalPrice = 0;

  double calculateAddPrice(ProductModel product) {
    totalPrice += product.price;
    return totalPrice;
  }

  double calculateRemovePrice(ProductModel product) {
    totalPrice -= product.price;
    return totalPrice;
  }
}
