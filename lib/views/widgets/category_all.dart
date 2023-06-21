import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/views/screens/products_screen.dart';

class CategoryAll extends StatelessWidget {
  const CategoryAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductScreen(
            id: '',
            name: 'All Products',
          ),
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
          child: const Center(
            child: Text(
              'All',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
