import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/views/ajuan_barang/components/card_ajuan_barang.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AjuanBarangScreen extends StatelessWidget {
  const AjuanBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.put(AjuanBarangController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Ajuan Barang",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: ListView.builder(
            itemCount:
                controller.items.length + (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.items.length) {
                final item = controller.items[index];
                return CardAjuanBarang(item: item);
              } else {
                controller.loadMore();
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(RouteName.tambahAjuanBarang);
          if (result == true) {
            controller.onRefresh();
          }
          controller.clearAddAjuanBarang();
        },
        backgroundColor: kPrimaryColor,
        child: Icon(PhosphorIcons.plus()),
      ),
    );
  }
}
