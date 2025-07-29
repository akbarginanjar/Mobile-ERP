import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (s) => const Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          widthFactor: 300,
          heightFactor: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/logo.png")),
              SizedBox(height: 10),
              Text(
                'BIMA ERP',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
