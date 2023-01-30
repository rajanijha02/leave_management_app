import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leave_management_app/app/common/dataController.dart';
import 'package:leave_management_app/app/models/get_user_profile_model.dart';
import 'package:leave_management_app/app/network/getx_service.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  PostsProvider _postsProvider = PostsProvider();
  DataController dataController = Get.find<DataController>();
  late GetStorage storage;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCirc,
  );
  @override
  void onInit() async {
    storage = GetStorage();

    await routeToPage();
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();

    super.onClose();
  }

  routeToPage() async {
    isLoading.value = false;
    await Future.delayed(Duration(seconds: 3));
    if (storage.read("token") != null) {
      var response = await _postsProvider.getCall("employe/profile");
      if (response.statusCode != 200) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        GetUserProfile userModels = GetUserProfile.fromJson(response.body);

        if (response.body.length > 0) {
          dataController.setUser(user: userModels);
          // dataController.setAllUserModel(user: userModels);
          Get.offAllNamed(Routes.DASHBOARD);
          isLoading.value = true;
        } else {
          dataController.setUser(user: userModels);
          Get.offAllNamed(Routes.LOGIN);
          isLoading.value = true;
        }
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
      isLoading.value = true;
    }
  }
}
