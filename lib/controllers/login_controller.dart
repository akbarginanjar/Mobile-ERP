import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/controllers/splash_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/services/auth_services.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
  List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error);
      update();
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
      update();
    }
  }

  void nextLogin() {
    try {
      SplashController().loading();
      AuthServices()
          .login(FormData({'email': mail.text, 'password': pass.text}))
          .then(
            (value) async => {
              if (value.statusCode == 200)
                {
                  box.write(Base.token, value.body['tokens']),
                  box.write(Base.user, jsonEncode(value.body['data'])),
                  box.write(Base.access, jsonEncode(value.body['access'])),
                  Get.offAllNamed(RouteName.home),
                  EasyLoading.showSuccess('Login Berhasil'),
                }
              else
                {
                  Get.back(),
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.only(top: 20),
                    title: 'Login Gagal',
                    middleText: value.body['message'].toString(),
                    textConfirm: 'Coba lagi',
                    contentPadding: EdgeInsets.only(bottom: 20, top: 10),
                    confirmTextColor: Colors.white,
                    buttonColor: kPrimaryColor,
                    onConfirm: () {
                      Get.back(); // Tutup dialog
                    },
                  ),
                },
            },
          );
    } catch (e) {
      Get.snackbar(
        'Fitur Maitanace !!',
        'Fitur ini sedang dalam masa perbaikan.',
      );
    }
  }
}
