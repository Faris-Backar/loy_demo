import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/sales_screen.dart';
import 'package:loyverse_demo/presentation/screens/splash_screen.dart';
import 'package:loyverse_demo/presentation/widgets/text_form_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool ispasswordVisible = false;
  bool isTextobscure = false;
  void submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
  }

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  TextFormWidget(
                    errorText: 'Please enter a Valid email',
                    nameController: emailController,
                    labelText: 'Email',
                    validatorFunction: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  TextFormWidget(
                    nameController: passwordController,
                    labelText: 'Password',
                    suffixIcon: ispasswordVisible
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                ispasswordVisible = !ispasswordVisible;
                                isTextobscure = !isTextobscure;
                              });
                            },
                            icon: const Icon(Icons.visibility_rounded),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                ispasswordVisible = !ispasswordVisible;
                                isTextobscure = !isTextobscure;
                              });
                            },
                            icon: const Icon(Icons.visibility_off_rounded),
                          ),
                    isTextObscure: isTextobscure,
                    errorText: 'Please enter a valid PassWord',
                    validatorFunction: (value) {
                      if (value!.isEmpty || value.length <= 5) {
                        return 'Enter a valid Password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setString('UserName', emailController.text);
                // prefs.setString('Password', passwordController.text);
                final _sharedPrefs = await SharedPreferences.getInstance();
                await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SalesScreen(),
                ));
              },
              child: Container(
                height: 60,
                color: Colors.lightGreen[600],
                alignment: Alignment.center,
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
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
