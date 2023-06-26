import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p_five_ecommerce/controllers/cart/cart_controller.dart';
import 'package:p_five_ecommerce/controllers/favorite/favorite_controller.dart';
import 'package:p_five_ecommerce/controllers/validations/login_validation.dart';
import 'package:p_five_ecommerce/controllers/validations/signup_validation.dart';
import 'package:p_five_ecommerce/views/screens/cart_screen.dart';
import 'package:p_five_ecommerce/views/screens/favorite_screen.dart';
import 'package:p_five_ecommerce/views/screens/login_screen.dart';
import 'package:p_five_ecommerce/views/screens/my_layout_screen.dart';
import 'package:p_five_ecommerce/views/screens/search_screen.dart';
import 'package:p_five_ecommerce/views/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        // GoRoute(
        //   path: '/',
        //   builder: (context, state) => const LoginScreen(),
        // ),
        // GoRoute(
        //   path: '/signup',
        //   builder: (context, state) => const SignupScreen(),
        // ),
        GoRoute(
          path: '/',
          builder: (context, state) => const MyLayoutScreen(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartScreen(),
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavoriteScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
      ],
    );
    return MultiProvider(
      providers: [
        ListenableProvider<SignupValidation>(
          create: (context) => SignupValidation(),
        ),
        ListenableProvider<LoginValidation>(
          create: (context) => LoginValidation(),
        ),
        ListenableProvider<Cart>(
          create: (context) => Cart(),
        ),
        ListenableProvider<FavoriteController>(
          create: (context) => FavoriteController(),
        ),
      ],
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
            shape: CircleBorder(),
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
