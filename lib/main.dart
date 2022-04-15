import 'package:flutter/material.dart';
import 'package:loyverse_demo/db/functions/db_functions.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';
import 'package:loyverse_demo/presentation/screens/sales_screen.dart';
import 'package:loyverse_demo/presentation/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseDB();
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
      home: const SplashScreen(),
    );
  }
}
