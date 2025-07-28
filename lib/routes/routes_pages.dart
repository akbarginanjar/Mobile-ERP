import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/views/splash/splash_screen.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => const SplashScreen()),
    // GetPage(
    //   name: RouteName.login,
    //   page: () => const LoginScreen(),
    // ),
  ];
}
