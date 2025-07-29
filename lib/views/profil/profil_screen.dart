import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/splash_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/views/splash/splash_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            DefaultButton(
              text: "Logout",
              color: kPrimaryColor,
              press: () {
                Get.defaultDialog(
                  titlePadding: EdgeInsets.only(top: 20),
                  title: "Yakin Keluar Dari Aplikasi?",
                  titleStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  content: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Tekan "Keluar" untuk keluar dari aplikasi.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    bottom: 20,
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  actions: [
                    DefaultButtonSecond(
                      text: "Batal",
                      press: () {
                        Get.back();
                      },
                    ),
                    DefaultButton(
                      text: "Keluar",
                      press: () {
                        SplashController().loading();
                        Timer(const Duration(seconds: 1), () async {
                          GetStorage().remove(Base.token);
                          GetStorage().remove(Base.user);
                          GetStorage().remove(Base.access);
                          Get.back();
                          Get.offAllNamed(RouteName.login);
                        });
                      },
                      color: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
