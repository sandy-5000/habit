import 'package:get/get.dart';
import 'package:habit/constants/colors.dart';
import 'package:habit/utils/color_theme.dart';

class ThemeController extends GetxController {
  var theme = redColorTheme.obs;

  void setTheme(ColorTheme theme) {
    this.theme.value = theme;
  }
}
