import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'images/empty_shopping_cart.png',
        ),
      ),
    );
  }
}
