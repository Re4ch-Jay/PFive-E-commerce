import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/controllers/cart/cart_controller.dart';
import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: value.userCart.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          ProductModel product = value.userCart[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              tileColor: Colors.grey[200],
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  product.imageUrl!,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              title: Text(
                                product.name!,
                                style: const TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                'Price \$${product.price.toString()}',
                                style: const TextStyle(color: Colors.black),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Provider.of<Cart>(context, listen: false)
                                      .removeItemToCart(product);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () => '',
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.black),
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'Pay Now \$${value.totalPrice}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: Image.asset(
                    'images/empty_shopping_cart.png',
                  ),
                ),
        ),
      ),
    );
  }
}
