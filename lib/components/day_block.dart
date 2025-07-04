import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/controllers/theme_controller.dart';

class DayBlock extends StatelessWidget {
  final DateTime date;
  final bool selected;

  DayBlock({super.key, required this.date, required this.selected});

  final ThemeController themeController = Get.find();
  // final borderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final isToday =
        date.day == today.day &&
        date.month == today.month &&
        date.year == today.year;

    final boxWidth = MediaQuery.of(context).size.width / 7.5;
    final boxHeight = boxWidth * 7 / 6;
    final innerBoxHeight = boxWidth * 25 / 35;
    final borderRadius = boxWidth / 3;
    final smallBorderRadius = boxWidth / 5;

    return SizedBox(
      width: boxWidth,
      height: boxHeight,
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
              SizedBox(
                width: double.infinity,
                height: boxHeight - innerBoxHeight,
                child: Center(
                  child: Text(
                    getWeekDay(date.weekday),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: themeController.theme.value.lightest,
                      fontFamily: 'Malish',
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: boxWidth,
                    height: innerBoxHeight,
                    decoration: BoxDecoration(
                      color: selected
                          ? themeController.theme.value.secondary
                          : themeController.theme.value.backgroundLighter,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(smallBorderRadius),
                        topRight: Radius.circular(smallBorderRadius),
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: themeController.theme.value.lightest,
                            fontFamily: 'Malish',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 3,
                      width: boxWidth / 3.5,
                      decoration: BoxDecoration(
                        color: isToday ? Color(0x77FFFFFF) : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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
