import 'package:flutter/material.dart';
import 'package:habit/layouts/main_layout.dart';
import 'package:habit/screens/home/tabs/today_tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(child: TodayTasks());
  }
}
