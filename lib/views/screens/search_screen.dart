import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:p_five_ecommerce/services/api_handler.dart';
import 'package:p_five_ecommerce/views/widgets/loading_widget.dart';
import 'package:p_five_ecommerce/views/widgets/product_card.dart';

class SearchScreen extends StatelessWidget {
  final String? searchText;
  const SearchScreen({super.key, this.searchText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(searchText != '' ? 'Search for $searchText' : ''),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: APIHandler.searchProduct(target: searchText!),
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
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel product = snapshot.data![index];
                      return ProductCard(
                        product: product,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
