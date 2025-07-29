import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/helpers/constants.dart';

class MaintananceScreen extends StatelessWidget {
  const MaintananceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              'Halaman Sedang Maintanance !!',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SvgPicture.asset("assets/icons/under-maintenance-dark.svg"),
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
    );
  }
}
