import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/controllers/main_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/views/home/home_screen.dart';
import 'package:mobile_erp/views/profil/profil_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (value) {
        return Scaffold(
          body: _screens[value.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (v) {
              value.changeIndex(v);
            },
            currentIndex: value.index,
            enableFeedback: true,
            selectedItemColor: kPrimaryColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.house(), size: 30),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.listChecks(), size: 30),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.user(), size: 30),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
