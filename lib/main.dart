import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/sales_screen.dart';
import 'package:loyverse_demo/presentation/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(const Loyverse());
}

class Loyverse extends StatelessWidget {
  const Loyverse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SalesScreen(),
    );
  }
}
