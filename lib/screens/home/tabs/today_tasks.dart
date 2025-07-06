import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habit/components/app_button.dart';
import 'package:habit/components/day_block.dart';
import 'package:habit/controllers/theme_controller.dart';
import 'package:icons_plus/icons_plus.dart';

class TodayTasks extends StatefulWidget {
  const TodayTasks({super.key});

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
  final ThemeController themeController = Get.find();
  final ScrollController _scrollController = ScrollController();
  final daysLength = 25;
  final GlobalKey _rowKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _scrollToTodayCenter();
    });
  }

  void _scrollToTodayCenter() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final rowContext = _rowKey.currentContext;
      if (rowContext == null) {
        return;
      }

      final rowBox = rowContext.findRenderObject() as RenderBox;
      final rowWidth = rowBox.size.width;
      final screenWidth = MediaQuery.of(context).size.width;
      double targetScrollOffset =
          rowWidth / 2 - (screenWidth.toInt() == 0 ? 177 : (screenWidth / 2));

      _scrollController.animateTo(
        targetScrollOffset,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final List<Widget> dayBlocks = List.generate(daysLength * 2 + 1, (index) {
      final date = today.add(Duration(days: index - daysLength));
      final isToday =
          date.day == today.day &&
          date.month == today.month &&
          date.year == today.year;
      return DayBlock(date: date, selected: isToday);
    });

    return Column(
      children: [
        SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            key: _rowKey,
            children: [...dayBlocks, SizedBox(width: 5)],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  AppTextButton(text: 'All', colored: true),
                  SizedBox(width: 5),
                  AppTextIconButton(
                    icon: Iconsax.element_plus_outline,
                    text: 'New list',
                  ),
                ],
              ),
              Row(
                children: [
                  AppIconButton(icon: CupertinoIcons.slider_horizontal_3),
                  SizedBox(width: 5),
                  AppIconButton(icon: CupertinoIcons.question_circle),
                  SizedBox(width: 5),
                  AppIconButton(icon: CupertinoIcons.xmark),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/icon_calender.png'),
              ),
              SizedBox(height: 25),
              Text(
                'There is nothing scheduled',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: themeController.theme.value.textOnBackground,
                  fontFamily: 'Mulish',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Try adding new activities',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: themeController.theme.value.light,
                  fontFamily: 'Mulish',
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}
