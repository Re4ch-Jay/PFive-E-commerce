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
        drawer: Drawer(
          backgroundColor: Colors.grey.shade800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    DrawerHeader(
                      child: Center(
                        child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png'),
                        ),
                      ),
                    ),
                    ListTile(
                      textColor: Colors.white,
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text('About'),
                    ),
                    ListTile(
                      textColor: Colors.white,
                      leading: Icon(
                        Icons.contact_mail,
                        color: Colors.white,
                      ),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      textColor: Colors.white,
                      leading: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      title: Text('Location'),
                    ),
                    ListTile(
                      textColor: Colors.white,
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Colors.white,
                      ),
                      title: Text('Privacy'),
                    ),
                    ListTile(
                      textColor: Colors.white,
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text('Logout'),
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Divider(),
                  ListTile(
                    textColor: Colors.white,
                    leading: Text('Version'),
                    title: Text('1.0.0'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
