import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
