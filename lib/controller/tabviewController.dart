import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControl extends GetxController with GetSingleTickerProviderStateMixin {
  static TabControl to = Get.find();
  late TabController controller;

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
