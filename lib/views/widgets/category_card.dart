import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/models/category_model.dart';
import 'package:p_five_ecommerce/views/screens/products_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductScreen(id: category.id.toString(), name: category.name),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Text(
              category.name!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
