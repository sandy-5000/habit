import 'package:get/get.dart';
import 'package:habit/controllers/counter_controller.dart';
import 'package:habit/controllers/route_controller.dart';
import 'package:habit/controllers/theme_controller.dart';

void initalizeControllers() {
  Get.put(ThemeController());
  Get.put(CounterController());
  Get.put(RouteController());
}
