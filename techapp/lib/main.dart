import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';
import 'view/home_page.dart';
import 'view/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smartpro Man',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SplashController>(() => SplashController());
          }),
        ),
        GetPage(name: '/home', page: () => const HomePage()),
      ],
    );
  }
}
