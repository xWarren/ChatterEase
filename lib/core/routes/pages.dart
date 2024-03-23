import 'package:get/get.dart';

import '../../feature/onboarding/onboarding_binding.dart';
import '../../feature/onboarding/onboarding_page.dart';
import '../../feature/splash/splash_binding.dart';
import '../../feature/splash/splash_page.dart';
import 'routes.dart';

class Pages {
  
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardingRoute,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
  ];
}