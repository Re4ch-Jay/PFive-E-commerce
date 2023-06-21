import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p_five_ecommerce/views/screens/home_screen.dart';
import 'package:p_five_ecommerce/views/screens/notification_screen.dart';
import 'package:p_five_ecommerce/views/widgets/my_navbar.dart';

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
    const NotificationScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('PFive'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => context.push('/cart'),
            )
          ],
        ),
        body: _body[_selectedIndex],
        bottomNavigationBar: MyNavbar(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
