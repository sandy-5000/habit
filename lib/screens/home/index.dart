import 'package:flutter/material.dart';
import 'package:habit/layouts/main_layout.dart';
import 'package:habit/screens/home/tabs/today_tasks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return mainLayout(context, TodayTasks());
  }
}
