import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/helpers/constants.dart';

class NoScreen extends StatelessWidget {
  const NoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Halaman Tidak Ada !!',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/error-dark.svg"),
                  SizedBox(
                    child: DefaultButton(
                      text: "Kembali ke Beranda",
                      press: () => Get.back(),
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
