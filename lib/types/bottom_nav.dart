import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

enum HomeNav {
  today('Today', OctIcons.tasklist),
  habits('Habits', Iconsax.medal_outline),
  tasks('Tasks', EvaIcons.checkmark_circle_outline),
  categories('Categories', Iconsax.category_2_outline),
  timer('Timer', Iconsax.timer_1_outline);

  final String name;
  final IconData icon;
  const HomeNav(this.name, this.icon);
}
