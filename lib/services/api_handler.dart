import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:p_five_ecommerce/models/category_model.dart';
import 'package:p_five_ecommerce/models/product_model.dart';

class APIHandler {
  static Future<dynamic> getData({required String target, String? id}) async {
    Uri uri = Uri.parse("http://192.168.1.4:8000/api/$target");
    var response = await http.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json"
    });

    return response;
  }

  static Future<List<ProductModel>> getAllProducts() async {
    var response = await getData(target: 'products');

    var data = jsonDecode(response.body);

    List<ProductModel> productList = [];

    for (var eachData in data) {
      final product = ProductModel(
        id: eachData['id'],
        categoryId: eachData['categoryId'],
        createdAt: eachData['createdAt'],
        description: eachData['description'],
        name: eachData['name'],
        imageUrl: eachData['imageUrl'],
        price: eachData['price'],
        rating: eachData['rating'],
        updatedAt: eachData['updatedAt'],
      );
      productList.add(product);
    }

    return productList;
  }

  static Future<List<CategoryModel>> getAllCategories() async {
    var response = await getData(target: 'categories');
    var data = jsonDecode(response.body);

    List<CategoryModel> categoryList = [];

    for (var eachData in data) {
      final product = CategoryModel(
        id: eachData['id'],
        createdAt: eachData['createdAt'],
        name: eachData['name'],
        updatedAt: eachData['updatedAt'],
      );
      categoryList.add(product);
    }

    return categoryList;
  }

  static Future<CategoryModel> getSingleCategory({required String id}) async {
    var response = await getData(target: 'categories/$id');
    var data = jsonDecode(response.body);
    return CategoryModel.fromJson(data);
  }

  static Future<List<ProductModel>> queryProductByCategory(
      {required String id}) async {
    var response = await getData(target: 'products?category=$id');
    var data = jsonDecode(response.body);

    List<ProductModel> categoryList = [];

    for (var eachData in data) {
      final product = ProductModel(
        id: eachData['id'],
        categoryId: eachData['categoryId'],
        createdAt: eachData['createdAt'],
        description: eachData['description'],
        name: eachData['name'],
        imageUrl: eachData['imageUrl'],
        price: eachData['price'],
        rating: eachData['rating'],
        updatedAt: eachData['updatedAt'],
      );
      categoryList.add(product);
    }

    return categoryList;
  }

  static Future<List<ProductModel>> searchProduct(
      {required String target}) async {
    var response = await getData(target: 'products?search=$target');
    var data = jsonDecode(response.body);

    List<ProductModel> categoryList = [];

    for (var eachData in data) {
      final product = ProductModel(
        id: eachData['id'],
        categoryId: eachData['categoryId'],
        createdAt: eachData['createdAt'],
        description: eachData['description'],
        name: eachData['name'],
        imageUrl: eachData['imageUrl'],
        price: eachData['price'],
        rating: eachData['rating'],
        updatedAt: eachData['updatedAt'],
      );
      categoryList.add(product);
    }

    return categoryList;
  }
}
