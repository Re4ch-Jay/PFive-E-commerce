import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'PFive',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '.',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
