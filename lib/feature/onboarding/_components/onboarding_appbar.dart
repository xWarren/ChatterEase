import 'package:flutter/material.dart';

class OnboardingAppBar extends AppBar{
  OnboardingAppBar({
    required this.currentPageIndex,
    required this.loginPage,
    super.key
  }) : super(
    backgroundColor: Colors.white,
    elevation: 0,
    actions:  [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          children: [
            currentPageIndex == 2
            ? const SizedBox.shrink() 
            : GestureDetector(
              onTap: loginPage,
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
            ) 
          ],
        ),
      )
    ],
  );

  final int currentPageIndex;
  final VoidCallback loginPage;
}