import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart';
import '../onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3), 
      () =>   Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const OnboardingPage()
      ), 
      (Route<dynamic> route) => false
    ));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Colors.white,
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