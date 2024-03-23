import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class SplashController extends GetxController {

  void nextPage() {
      Get.offAndToNamed(Routes.onboardingRoute);
  }


   @override
  void onInit() {
    Future.delayed(3.seconds, () => nextPage());
    super.onInit();
  }
}