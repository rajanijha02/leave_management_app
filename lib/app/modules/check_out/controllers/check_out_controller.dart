import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  RxList<String> works = <String>[].obs;
  TextEditingController workController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addDataToList() {
    if (workController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter work');
      return;
    } else {
      works.add(workController.text);
      workController.clear();
      works.refresh();
    }
  }

  removeDataFromList({required String data}) {
    works.remove(data);
    works.refresh();
  }
}
