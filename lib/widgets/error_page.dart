import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(content)),
    );
  }
}
