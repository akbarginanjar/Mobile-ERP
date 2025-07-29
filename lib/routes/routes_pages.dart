import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/views/analisis_market/analisis_market_screen.dart';
import 'package:mobile_erp/views/login/login_screen.dart';
import 'package:mobile_erp/views/main/main_screen.dart';
import 'package:mobile_erp/views/splash/splash_screen.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => const SplashScreen()),
    GetPage(name: RouteName.login, page: () => const LoginScreen()),
    GetPage(name: RouteName.home, page: () => MainScreen()),
    GetPage(name: RouteName.analisis, page: () => const AnalisisMarketScreen()),
  ];
}
