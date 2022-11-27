import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/homepage_binding.dart';
import '../bindings/login_page_binding.dart';
import '../screens/dashboard.dart';
import '../screens/login_page.dart';
import '../screens/splash_screen.dart';
import '../utils/constants.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: ROUTE_SPLASH, page: () => SplashPage()),
    GetPage(
        name: ROUTE_LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: ROUTE_DASHBOARD,
        page: () => DashboardPage(),
        binding: DashboardBinding())
  ];
}
