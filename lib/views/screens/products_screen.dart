import 'package:flutter/material.dart';

import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:p_five_ecommerce/services/api_handler.dart';
import 'package:p_five_ecommerce/views/widgets/cart_icon.dart';
import 'package:p_five_ecommerce/views/widgets/loading_widget.dart';
import 'package:p_five_ecommerce/views/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  final String? name;
  const ProductScreen({super.key, required this.id, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(name.toString()),
        centerTitle: true,
        actions: const [
          CartIcon(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            FutureBuilder(
              future: APIHandler.queryProductByCategory(id: id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error ${snapshot.error}'),
                  );
                } else if (snapshot.data == null) {
                  return Center(
                    child: Image.asset('images/empty_shopping_cart.png'),
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        ProductModel product = snapshot.data![index];
                        return ProductCard(product: product);
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
