import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  final void Function(int)? onTabChange;
  final int selectedIndex;
  const MyBottomNavbar({
    super.key,
    this.onTabChange,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GNav(
        padding: const EdgeInsets.all(10),
        onTabChange: onTabChange!,
        backgroundColor: Colors.transparent,
        activeColor: Colors.black,
        color: Colors.grey[600],
        tabBorderRadius: 10,
        tabActiveBorder: Border.all(color: Colors.black),
        selectedIndex: selectedIndex,
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorites',
          ),
        ],
      ),
    );
  }
}
