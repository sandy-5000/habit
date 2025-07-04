import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';

Widget dayBlock(DateTime date, bool selected) {
  final ThemeController themeController = Get.find();
  final borderRadius = 16.0;

  final DateTime today = DateTime.now();
  final isToday =
      date.day == today.day &&
      date.month == today.month &&
      date.year == today.year;

  return SizedBox(
    width: 50,
    height: 54,
    child: Container(
      padding: EdgeInsets.only(left: 5),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: selected
              ? themeController.theme.value.primary
              : themeController.theme.value.backgroundLight,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                getWeekDay(date.weekday),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: themeController.theme.value.lighter,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 7),
              width: double.infinity,
              decoration: BoxDecoration(
                color: selected
                    ? themeController.theme.value.secondary
                    : themeController.theme.value.backgroundLighter,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Center(
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: themeController.theme.value.lighter,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 13,
                    decoration: BoxDecoration(
                      color: isToday ? Color(0x77FFFFFF) : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String getWeekDay(int weekDay) {
  switch (weekDay) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
  }
  return "Non";
}
