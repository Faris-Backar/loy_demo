import 'package:flutter/material.dart';
import 'package:loyverse_demo/core/config/config.dart';
import 'package:loyverse_demo/presentation/screens/login_screen.dart';
import 'package:loyverse_demo/presentation/screens/registration_screen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = Config.screenHeight(context);
    double screenWidth = Config.screenWidth(context);
    return Scaffold(
      body: Column(
        children: [
          buildLogoBanner(screenHeight),
          buildAuthenticationButtons(screenHeight, context, screenWidth),
        ],
      ),
    );
  }

  Container buildAuthenticationButtons(
      double screenHeight, BuildContext context, double screenWidth) {
    return Container(
      height: screenHeight * .4,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: screenHeight * .025,
        right: screenHeight * .025,
        top: screenHeight * .12,
        bottom: screenHeight * .1,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegistrationScreen(),
            )),
            child: Container(
              height: screenHeight * .06,
              width: screenWidth,
              color: Colors.lightGreen[600],
              alignment: Alignment.center,
              child: const Text(
                'REGISTRATION',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LogInScreen(),
              ),
            ),
            child: Container(
              height: screenHeight * .06,
              width: screenWidth,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen[600]!),
              ),
              alignment: Alignment.center,
              child: Text(
                'SIGN IN',
                style: TextStyle(
                    color: Colors.lightGreen[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildLogoBanner(double screenHeight) {
    return Container(
      height: screenHeight * .6,
      color: Colors.green,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image:
                AssetImage('assets/images/loyverse-logo-removebg-preview.png'),
          ),
          SizedBox(
            child: Column(
              children: const [
                Text(
                  'LOYVERSE',
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'POINT OF SALE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
