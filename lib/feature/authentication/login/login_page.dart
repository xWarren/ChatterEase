import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "LOGIN PAGE",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}