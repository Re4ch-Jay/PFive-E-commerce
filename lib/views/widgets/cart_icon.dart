import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:p_five_ecommerce/controllers/cart/cart_controller.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
          onTap: () => context.push('/cart'),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 5, end: -12),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeAnimation: const badges.BadgeAnimation.rotation(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeStyle: const badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.red,
              padding: EdgeInsets.all(8),
              borderSide: BorderSide(color: Colors.white, width: 2),
              elevation: 0,
            ),
            badgeContent: Text(
              value.userCart.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
