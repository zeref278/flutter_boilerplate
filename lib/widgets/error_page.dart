import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(content)),
    );
  }
}
