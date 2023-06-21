import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('images/banner.png'),
      ),
    );
  }
}
