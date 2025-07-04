import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';
import 'package:icons_plus/icons_plus.dart';

PreferredSizeWidget appTopBar() {
  final ThemeController themeController = Get.find();

  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: themeController.theme.value.background,
    title: Container(
      color: themeController.theme.value.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.menu_board_outline,
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
                Iconsax.search_normal_1_outline,
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
