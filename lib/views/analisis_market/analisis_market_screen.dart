import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/controllers/analisis_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/views/analisis_market/components/card_analisis.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AnalisisMarketScreen extends StatelessWidget {
  const AnalisisMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnalisisController controller = Get.put(AnalisisController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Analisis Market",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => await controller.refreshData(),
          child: Obx(
            () => ListView.builder(
              controller: controller.scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount:
                  controller.dataList.length +
                  (controller.isLoading.value || !controller.hasMore.value
                      ? 1
                      : 0),
              itemBuilder: (context, index) {
                if (index < controller.dataList.length) {
                  final item = controller.dataList[index];
                  return AnalisisCard(
                    data: item,
                    onDetailPressed: () async {
                      Get.toNamed(RouteName.detailAnalisis, arguments: item);
                    },
                  );
                } else {
                  // Lazy load loading indicator
                  if (controller.isLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Memuat data",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          "Tidak ada lagi data",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(RouteName.tambahAnalisis);
          if (result == true) {
            controller.refreshData();
          }
        },
        backgroundColor: kPrimaryColor,
        child: Icon(PhosphorIcons.plus()),
      ),
    );
  }
}
