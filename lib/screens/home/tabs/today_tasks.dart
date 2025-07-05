import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/components/day_block.dart';
import 'package:habit/controllers/theme_controller.dart';

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
      ],
    );
  }
}
