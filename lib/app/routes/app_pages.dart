import 'package:get/get.dart';

import 'package:blood_donation/app/modules/auth/bindings/auth_binding.dart';
import 'package:blood_donation/app/modules/auth/views/auth_view.dart';
import 'package:blood_donation/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:blood_donation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:blood_donation/app/modules/home/bindings/home_binding.dart';
import 'package:blood_donation/app/modules/home/views/home_view.dart';
import 'package:blood_donation/app/modules/slider/bindings/slider_binding.dart';
import 'package:blood_donation/app/modules/slider/views/slider_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SLIDER;
  static const LOGGED_IN = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER,
      page: () => SliderView(),
      binding: SliderBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
