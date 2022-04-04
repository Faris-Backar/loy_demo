import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var businessController = TextEditingController();
  // var emailController = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordObscure = false;
  void _onsubmit() {
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
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                    validatorFunction: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    controller: passwordController,
                    isPasswordObscure: isPasswordObscure,
                    iconButton: isPasswordVisible
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                            icon: Icon(
                              Icons.visibility_rounded,
                            ))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                            icon: Icon(Icons.visibility_off_rounded)),
                    validatorFunction: (value) {
                      if (value!.isEmpty || value.length <= 5) {
                        return 'Enter a valid Password!';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Business Name',
                    controller: businessController,
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Business name!';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: _onsubmit,
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
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validatorFunction,
    this.iconButton,
    required this.labelText,
    this.isPasswordObscure,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconButton? iconButton;
  final String? Function(String?) validatorFunction;
  final bool? isPasswordObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: iconButton,
        ),
        obscureText: isPasswordObscure!,
        validator: validatorFunction);
  }
}
