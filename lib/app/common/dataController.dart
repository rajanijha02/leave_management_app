import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leave_management_app/app/models/get_user_profile_model.dart';

class DataController extends GetxController {
  Rx<GetUserProfile> user = GetUserProfile().obs;
  GetStorage getStorage = GetStorage();

  getUser() async {
    final data = await getStorage.read("user");
    GetUserProfile userData = GetUserProfile.fromJson(json.decode(data));
    user.value = userData;
   // print("user data is ${user.value.email}");
  }

  setUser({required GetUserProfile user}) {
    this.user.value = user;
  }
}
