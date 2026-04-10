import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble progress = 0.0.obs;
  @override
  void onReady() {
    super.onReady();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      progress.value += 0.0333;
      if (progress.value >= 1.0) {
        progress.value = 1.0;
        timer.cancel();
        Get.offNamed('/home');
      } 
    });
  }
}
