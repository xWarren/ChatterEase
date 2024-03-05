import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';
import '../authentication/login/login_page.dart';
import '_components/onboarding_appbar.dart';
import '_components/onboarding_list.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController pageController = PageController();

  int currentPageIndex = 0;

  void onPageChanged(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  void loginPage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginPage()
      ), 
      (Route<dynamic> route) => false
    );
  }

  void nextPage() {
    setState(() {
      if (currentPageIndex == 2) {
        loginPage();
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500), 
          curve: Curves.fastOutSlowIn
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(
        currentPageIndex: currentPageIndex,
        loginPage: loginPage,
        ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onboardingList.length,
              itemBuilder: (context, index) {
                var  data = onboardingList[index];
                return Column(
                  children: [
                    Image.asset(
                      data.image,
                      scale: 4,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      alignment: Alignment.center,
                      child: Text(
                        data.title,
                        style: const TextStyle(
                          color: CustomColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        child: Text(
                          data.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: CustomColors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingList.length, 
                  (index) => Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPageIndex == index 
                        ? CustomColors.buttonColor
                        : CustomColors.fade,
                      ),
                    )
                )
              ),
            ],
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                nextPage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.buttonColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child:Text(
               currentPageIndex == 2 ? "Get Started" : "Next",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}