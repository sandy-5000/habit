import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';

Widget bottomNavBar() {
  final ThemeController themeController = Get.find();

  return Container(
    color: themeController.theme.value.backgroundLight,
    padding: EdgeInsets.only(bottom: 20),
    child: Row(),
  );
}
