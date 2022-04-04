import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              // onTap: _onsubmit,
              child: Container(
                height: 60,
                color: Colors.lightGreen[600],
                alignment: Alignment.center,
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
