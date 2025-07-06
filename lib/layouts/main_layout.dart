import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habit/components/app_top_bar.dart';
import 'package:habit/components/app_bottom_bar.dart';
import 'package:habit/components/floating_button.dart';
import 'package:habit/controllers/theme_controller.dart';

class MainLayout extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final Widget child;

  MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // android
        statusBarBrightness: Brightness.dark, // iOS
        systemNavigationBarColor: Color(0xFF1C1C1C),
      ),
      child: Obx(
        () => Scaffold(
          backgroundColor: themeController.theme.value.background,
          body: SafeArea(
            child: Scaffold(
              appBar: appTopBar(),
              body: Container(
                width: MediaQuery.of(context).size.width,
                color: themeController.theme.value.background,
                child: child,
              ),
              floatingActionButton: appFloatingActionButton(),
              bottomNavigationBar: AppBottomBar(),
            ),
          ),
        ),
      ),
    );
  }
}
