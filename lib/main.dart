import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit/screens/about.dart';
import 'package:habit/screens/home/index.dart';
import 'package:habit/utils/initalize_controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initalizeControllers();
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final transition = Transition.rightToLeft;
    final transitionDuration = 150;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          transition: transition,
          opaque: true,
          transitionDuration: Duration(milliseconds: 150),
        ),
        GetPage(
          name: '/about',
          page: () => About(),
          transition: transition,
          opaque: true,
          transitionDuration: Duration(milliseconds: transitionDuration),
        ),
      ],
    );
  }
}
