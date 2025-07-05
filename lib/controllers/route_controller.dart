import 'package:get/get.dart';
import 'package:habit/types/bottom_nav.dart';
import 'package:habit/utils/navigation.dart';

class RouteController extends GetxController {
  var route = Screen.home.obs;
  var tab = HomeNav.today.obs;

  void goTo({
    required Screen screen,
    bool replace = false,
    bool emptyStack = false,
    Map<String, String> params = const {},
  }) {
    route.value = screen;
    if (emptyStack) {
      Get.offAllNamed(screen.name, parameters: params);
    } else if (replace) {
      Get.offNamed(screen.name, parameters: params);
    } else {
      Get.toNamed(screen.name, parameters: params);
    }
  }

  void selectTab(HomeNav tab) {
    this.tab.value = tab;
  }
}
