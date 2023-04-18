import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../views/landing.page.dart';
import '../views/login.dart';
import '../views/signup.dart';
import '../views/splash.dart';
import 'route.name.dart';

class AppScreen {
  static final screens = [
    GetPage(name: RouteName.splash, page: () => Splash()),
    GetPage(name: RouteName.signup, page: () => SignUp()),
    GetPage(name: RouteName.landingPage, page: () => const LandingPage()),
    GetPage(name: RouteName.login, page: () => Login()),
  ];
}
