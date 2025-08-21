import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/stok_barang_mobil_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/gudang_model.dart';
import 'package:mobile_erp/views/stok_barang_mobil/detail_stok_barang_mobil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StokBarangMobilScreen extends StatelessWidget {
  const StokBarangMobilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StokBarangMobilController controller = Get.put(
      StokBarangMobilController(),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Kendaraan Barang",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: ListView.builder(
            itemCount: controller.items.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.items.length) {
                final GudangModel item = controller.items[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[300]!, width: 1.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: Wrap(
                          spacing: 5, // jarak horizontal antar badge
                          runSpacing: 5, // jarak vertikal kalau pindah baris
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    PhosphorIcons.truck(),
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    item.driver?.namaLengkap ?? "-",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    PhosphorIcons.user(),
                                    color: Colors.white,
                                    size: 11,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    item.karyawan?.namaLengkap ?? "-",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    PhosphorIcons.mapPinSimpleArea(),
                                    color: Colors.white,
                                    size: 11,
                                  ),
                                  SizedBox(width: 3),
                                  Flexible(
                                    child: Text(
                                      "${item.teritori?.namaTeritori ?? '-'} - ${item.alamat ?? '-'}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        minTileHeight: 10,
                        leading: Icon(Icons.car_rental),
                        title: Text(
                          item.kendaraan?.namaKendaraan ?? "-",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Plat: ${item.kendaraan?.platNomer ?? '-'}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: DefaultButtonSecond(
                          text: 'Lihat Stok',
                          press: () {
                            Get.to(DetailStokBarangMobilScreen(gudang: item));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                if (controller.hasMore.value) {
                  controller.loadMore();
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Tidak ada data lagi"),
                    ),
                  );
                }
              }
            },
          ),
        );
      }),
    );
  }
}
