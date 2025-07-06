import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final bool colored;
  final void Function()? onPress;
  final ThemeController themeController = Get.find();

  AppTextButton({
    super.key,
    required this.text,
    this.colored = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: colored
              ? themeController.theme.value.tertiary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colored
                ? themeController.theme.value.primary
                : themeController.theme.value.textOnBackground,
            fontSize: 13,
            fontFamily: 'Mulish',
          ),
        ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final bool colored;
  final void Function()? onPress;
  final ThemeController themeController = Get.find();

  AppIconButton({
    super.key,
    required this.icon,
    this.colored = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: colored
              ? themeController.theme.value.tertiary
              : Colors.transparent,
          border: BoxBorder.all(
            color: colored
                ? themeController.theme.value.primary
                : themeController.theme.value.backgroundLighter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: colored
              ? themeController.theme.value.primary
              : themeController.theme.value.light,
          size: 16,
        ),
      ),
    );
  }
}

class AppTextIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool colored;
  final void Function()? onPress;
  final ThemeController themeController = Get.find();

  AppTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    this.colored = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 12),
        decoration: BoxDecoration(
          color: colored
              ? themeController.theme.value.tertiary
              : Colors.transparent,
          border: BoxBorder.all(
            color: colored
                ? themeController.theme.value.primary
                : themeController.theme.value.backgroundLighter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: colored
                  ? themeController.theme.value.primary
                  : themeController.theme.value.light,
              size: 15,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: colored
                    ? themeController.theme.value.primary
                    : themeController.theme.value.textOnBackground,
                fontSize: 13,
                fontFamily: 'Mulish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
