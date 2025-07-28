import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/theme.dart';
import 'package:mobile_erp/routes/routes_pages.dart';
import 'package:mobile_erp/views/error/no_screen.dart';
import 'package:mobile_erp/views/splash/splash_screen.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
  // await initializeService();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIMA ERP',
      unknownRoute: GetPage(
        name: RouteName.noPage,
        page: () => const NoScreen(),
      ),
      theme: theme(),
      getPages: Routes.pages,
      home: const SplashScreen(),
    );
  }
}
