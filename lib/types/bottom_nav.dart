import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

enum HomeNav {
  today('today', OctIcons.tasklist),
  habits('habits', Iconsax.medal_outline),
  tasks('tasks', EvaIcons.checkmark_circle_outline),
  categories('categories', Iconsax.category_2_outline),
  timer('timer', Iconsax.timer_1_outline);

  final String name;
  final IconData icon;
  const HomeNav(this.name, this.icon);
}
