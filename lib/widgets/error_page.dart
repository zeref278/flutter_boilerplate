import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(S.current.didnt_supported)),
    );
  }
}
