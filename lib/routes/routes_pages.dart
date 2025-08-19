import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/models/penyimpanan_barang_model.dart';
import 'package:mobile_erp/views/ajuan_barang/add_ajuan_barang_screen.dart';
import 'package:mobile_erp/views/ajuan_barang/ajuan_barang_screen.dart';
import 'package:mobile_erp/views/ajuan_barang/penyimpanan_barang_screen.dart';
import 'package:mobile_erp/views/ajuan_barang/rincian_ajuan_barang_screen.dart';
import 'package:mobile_erp/views/analisis_market/add_analisis_screen.dart';
import 'package:mobile_erp/views/analisis_market/analisis_market_screen.dart';
import 'package:mobile_erp/views/analisis_market/detail_analisis.dart';
import 'package:mobile_erp/views/login/login_screen.dart';
import 'package:mobile_erp/views/main/main_screen.dart';
import 'package:mobile_erp/views/splash/splash_screen.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => const SplashScreen()),
    GetPage(name: RouteName.login, page: () => const LoginScreen()),
    GetPage(name: RouteName.home, page: () => MainScreen()),
    GetPage(name: RouteName.analisis, page: () => const AnalisisMarketScreen()),
    GetPage(
      name: RouteName.tambahAnalisis,
      page: () => const AddAnalisisScreen(),
    ),
    GetPage(
      name: RouteName.detailAnalisis,
      page: () => const DetailAnalisisScreen(),
    ),
    GetPage(
      name: RouteName.requestBarang,
      page: () => const AjuanBarangScreen(),
    ),
    GetPage(
      name: RouteName.tambahAjuanBarang,
      page: () => const AddAjuanBarangScreen(),
    ),
  ];
}
