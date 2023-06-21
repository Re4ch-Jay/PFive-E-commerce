import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:p_five_ecommerce/views/screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(id: product.id!, product: product),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl.toString(),
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
            ),
            Text(product.name.toString()),
          ],
        ),
      ),
    );
  }
}
