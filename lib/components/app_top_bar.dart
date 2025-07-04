import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';

PreferredSizeWidget appTopBar() {
  final ThemeController themeController = Get.find();
  const paddingHorizontal = 12.0;

  return PreferredSize(
    preferredSize: const Size.fromHeight(72),
    child: Container(
      padding: EdgeInsets.only(
        top: 16,
        left: paddingHorizontal,
        right: paddingHorizontal,
      ),
      color: themeController.theme.value.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.slider_horizontal_3,
                color: themeController.theme.value.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                "Today",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.search,
                color: themeController.theme.value.light,
                size: 22,
              ),
              const SizedBox(width: 20),
              Icon(
                CupertinoIcons.calendar,
                color: themeController.theme.value.light,
                size: 22,
              ),
              const SizedBox(width: 20),
              Icon(
                CupertinoIcons.question_circle,
                color: themeController.theme.value.light,
                size: 22,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
