import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loyverse_demo/core/config/config.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Config.screenHeight(context);
    double screenWidth = Config.screenWidth(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * .2,
              width: screenWidth * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage('assets/images/loyverse.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Loyverse',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.grey[350],
              ),
            )
            // Image(image: AssetImage('assets/images/loyverse.png')),
          ],
        ),
      ),
    );
  }
}
