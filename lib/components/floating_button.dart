import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/route_controller.dart';
import 'package:habit/controllers/theme_controller.dart';
import 'package:habit/utils/navigation.dart';

Widget? appFloatingActionButton() {
  final RouteController routeController = Get.find();
  final ThemeController themeController = Get.find();

  if (Screen.home == routeController.route.value) {
    return FloatingActionButton(
      onPressed: null,
      backgroundColor: themeController.theme.value.primary,
      foregroundColor: themeController.theme.value.textOnPrimary,
      tooltip: 'plus',
      child: const Icon(Icons.add, size: 26),
    );
  }

  return null;
}
