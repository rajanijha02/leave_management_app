import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? Container()
              : FadeTransition(
                  opacity: controller.animation,
                  child: Image.asset(
                    'assets/images/logo1.png',
                    height: 200,
                    width: 200,
                  ),
                ),
        ),
      ),
    );
  }
}
