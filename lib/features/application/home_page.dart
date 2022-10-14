import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.go_route),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text(S.current.dog_image_random),
              onPressed: () {
                context.push(AppRouter.dogImageRandomPath);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(S.current.config),
              onPressed: () {
                context.push(AppRouter.config);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(S.current.assets),
              onPressed: () {
                context.push(AppRouter.assets);
              },
            ),
          ],
        ),
      ),
    );
  }
}
