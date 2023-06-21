import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavbar extends StatelessWidget {
  final void Function(int)? onTabChange;
  final int selectedIndex;
  const MyNavbar({
    super.key,
    this.onTabChange,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GNav(
        onTabChange: onTabChange!,
        backgroundColor: Colors.transparent,
        activeColor: Colors.black,
        color: Colors.grey[600],
        tabBorderRadius: 10,
        tabActiveBorder: Border.all(color: Colors.black),
        selectedIndex: selectedIndex,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.notifications,
            text: 'Notifications',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
