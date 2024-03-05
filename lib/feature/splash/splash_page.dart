import 'package:flutter/material.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.fade,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(Assets.splashGIF),
            ),
            const Text(
              "Chatter Ease",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}