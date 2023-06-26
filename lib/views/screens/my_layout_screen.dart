import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/views/screens/favorite_screen.dart';
import 'package:p_five_ecommerce/views/screens/home_screen.dart';
import 'package:p_five_ecommerce/views/widgets/app_name.dart';
import 'package:p_five_ecommerce/views/widgets/cart_icon.dart';
import 'package:p_five_ecommerce/views/widgets/my_drawer.dart';
import 'package:p_five_ecommerce/views/widgets/my_bottom_navbar.dart';

class MyLayoutScreen extends StatefulWidget {
  const MyLayoutScreen({
    super.key,
  });

  @override
  State<MyLayoutScreen> createState() => _MyLayoutScreenState();
}

class _MyLayoutScreenState extends State<MyLayoutScreen> {
  int _selectedIndex = 0;
  final List<Widget> _body = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const AppName(),
          centerTitle: true,
          actions: const [
            CartIcon(),
          ],
        ),
        body: _body[_selectedIndex],
        bottomNavigationBar: MyBottomNavbar(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
