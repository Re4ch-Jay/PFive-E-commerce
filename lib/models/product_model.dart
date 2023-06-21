import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  int? id;
  String? name;
  String? description;
  dynamic? price;
  String? imageUrl;
  dynamic? rating;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.imageUrl,
      this.rating,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
