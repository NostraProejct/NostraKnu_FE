import 'package:flutter/material.dart';
import 'infra/router/router.dart';

void main() {
  runApp(const Nostra());
}
class Nostra extends StatelessWidget {
  const Nostra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Nostra",
      routerConfig: router,
    );
  }
}