import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habit/components/app_top_bar.dart';
import 'package:habit/components/bottom_navbar.dart';
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
        systemNavigationBarColor: Color(0xFF121313),
      ),
      child: Scaffold(
        backgroundColor: themeController.theme.value.background,
        body: SafeArea(
          child: Scaffold(
            appBar: appTopBar(),
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: themeController.theme.value.background,
              child: child,
            ),
            bottomNavigationBar: BottomNavBar(),
          ),
        ),
      ),
    );
  }
}
