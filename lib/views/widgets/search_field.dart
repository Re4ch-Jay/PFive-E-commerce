import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchTextController;
  final VoidCallback onPressed;
  const SearchField({
    super.key,
    required this.onPressed,
    required this.searchTextController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchTextController,
      decoration: InputDecoration(
        hintText: 'What would you like to buy?',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onPressed,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
