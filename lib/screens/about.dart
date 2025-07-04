import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/counter_controller.dart';
import 'package:habit/controllers/theme_controller.dart';
import 'package:habit/layouts/main_layout.dart';

class About extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final CounterController controller = Get.find();
  About({super.key});

  @override
  Widget build(BuildContext context) {
    return mainLayout(
      context,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "Habit - it ab ${controller.count}",
              style: TextStyle(
                color: themeController.theme.value.textOnBackground,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.inc();
              Get.offNamed('/');
            },
            child: Text(
              "+Count",
              style: TextStyle(
                color: themeController.theme.value.textOnBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
