import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/controllers/favorite/favorite_controller.dart';
import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:p_five_ecommerce/views/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteController>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: value.userFavoriteList.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.userFavoriteList.length,
                      itemBuilder: (context, index) {
                        ProductModel product = value.userFavoriteList[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  id: product.id!, product: product),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              tileColor: Colors.grey[200],
                              leading: ClipRRect(
                                child: Image.network(
                                  product.imageUrl.toString(),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              title: Text(product.name!),
                              subtitle: Text('\$${product.price.toString()}'),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () =>
                                    Provider.of<FavoriteController>(context,
                                            listen: false)
                                        .toggleFavorite(product),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: Image.asset(
                  'images/empty_shopping_cart.png',
                ),
              ),
      ),
    );
  }
}
