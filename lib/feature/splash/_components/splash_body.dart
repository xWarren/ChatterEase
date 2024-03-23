import 'package:flutter/material.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          ),
        ],
      ),
    );
  }
}