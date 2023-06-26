import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/models/product_model.dart';

class FavoriteController extends ChangeNotifier {
  // user Favorite List

  final List<ProductModel> _userFavoriteList = [];

  // get user favorite list
  List<ProductModel> get userFavoriteList => _userFavoriteList;

  // toggle favorite

  void toggleFavorite(ProductModel product) {
    final isExist = _userFavoriteList.contains(product);
    if (isExist) {
      _userFavoriteList.remove(product);
    } else {
      _userFavoriteList.add(product);
    }
    notifyListeners();
  }

  bool isExist(ProductModel product) {
    return _userFavoriteList.contains(product);
  }
}
