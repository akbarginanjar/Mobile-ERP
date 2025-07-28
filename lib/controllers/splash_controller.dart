import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/helpers/base.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () async {
      // String? token = box.read(Base.token);
      // String? user = box.read(Base.user);
      // if (user == null && token == null) {
      //   Get.offNamed(RouteName.login);
      // } else {
      //   Get.offNamed(RouteName.pin);
      // }
      Get.offNamed(RouteName.login);
    });
  }

  // void sesionOut(title, message) {
  //   box.remove(Base.token);
  //   box.remove(Base.user);
  //   box.remove(Base.acess);
  //   Get.snackbar(title, message);
  //   Get.offAllNamed(RouteName.login);
  // }

  // void sesion() {
  //   var tokens = box.read(Base.token);
  //   AuthServices().refresh(tokens).then((value) {
  //     if (value.statusCode == 200) {
  //       box.write(Base.token, value.body['tokens']);
  //     } else {
  //       sesionOut('Sesi Habis', 'Silahkan login kembali');
  //     }
  //   });
  // }

  void loading() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(strokeWidth: 10),
          ),
        ),
      ),
    );
  }
}
