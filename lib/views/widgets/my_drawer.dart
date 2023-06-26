import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'PFive',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text('About'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.contact_mail,
                    color: Colors.black,
                  ),
                  title: Text('Contact'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Colors.black,
                  ),
                  title: Text('Location'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: Colors.black,
                  ),
                  title: Text('Privacy'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
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
                leading: Text('Version'),
                title: Text('1.0.0'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
