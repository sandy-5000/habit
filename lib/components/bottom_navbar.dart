import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/route_controller.dart';
import 'package:habit/controllers/theme_controller.dart';
import 'package:habit/types/bottom_nav.dart';

class BottomNavBar extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final RouteController routeController = Get.find();

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final betweenSpace = 8.0;
    final navValues = [
      HomeNav.today,
      HomeNav.habits,
      HomeNav.tasks,
      HomeNav.categories,
      HomeNav.timer,
    ];

    final normalTextStyle = TextStyle(
      color: themeController.theme.value.textOnBackground,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Mulish',
    );
    final selectedTextStyle = TextStyle(
      color: themeController.theme.value.primary,
      fontSize: 14,
      fontWeight: FontWeight.w800,
      fontFamily: 'Mulish',
    );

    final selectedDecoration = BoxDecoration(
      color: themeController.theme.value.tertiary,
      borderRadius: BorderRadius.circular(30),
    );

    final selectedColor = themeController.theme.value.primary;
    final normalColor = themeController.theme.value.textOnPrimary;

    return Obx(() {
      final selected = routeController.tab.value;

      return SizedBox(
        height: 80,
        width: double.infinity,
        child: Container(
          color: themeController.theme.value.backgroundLight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navValues.map((navItem) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      routeController.selectTab(navItem);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      decoration: navItem == selected
                          ? selectedDecoration
                          : null,
                      child: Icon(
                        // Iconsax.task_square_outline,
                        navItem.icon,
                        size: 20,
                        color: navItem == selected
                            ? selectedColor
                            : normalColor,
                      ),
                    ),
                  ),
                  SizedBox(height: betweenSpace),
                  Text(
                    navItem.name,
                    style: navItem == selected
                        ? selectedTextStyle
                        : normalTextStyle,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
