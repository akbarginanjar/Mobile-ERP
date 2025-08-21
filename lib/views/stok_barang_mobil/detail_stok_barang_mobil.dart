import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/controllers/stok_barang_mobil_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/gudang_model.dart';
import 'package:mobile_erp/models/stok_mobil_model.dart';

class DetailStokBarangMobilScreen extends StatelessWidget {
  final GudangModel gudang;
  const DetailStokBarangMobilScreen({super.key, required this.gudang});

  @override
  Widget build(BuildContext context) {
    final StokBarangMobilController controller = Get.put(
      StokBarangMobilController(),
    );
    controller.loadDataStokMobil(idGudang: gudang.id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Stok Mobil",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.onRefreshStokMobil(gudang.id);
            },
            icon: Icon(Icons.refresh),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.isLoadingStokMobil.value &&
            controller.itemsStokMobil.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Card(
                margin: EdgeInsets.all(0),
                elevation: 0,
                color: Colors.orange[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 15,
                  ),
                  child: Text(
                    "${gudang.kendaraan!.namaKendaraan} - ${gudang.kendaraan!.platNomer}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // biar tinggi menyesuaikan
              physics:
                  NeverScrollableScrollPhysics(), // biar tidak bentrok scroll
              itemCount: controller.itemsStokMobil.length + 1,
              itemBuilder: (context, index) {
                if (index < controller.itemsStokMobil.length) {
                  final StokMobilModel item = controller.itemsStokMobil[index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!, width: 1.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.nama ?? "-",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("Kode: ${item.kode ?? '-'}"),
                          Text("Satuan: ${item.satuan ?? '-'}"),
                          Text("Kategori: ${item.kategori ?? '-'}"),
                          Text("Stok: ${item.stok ?? 0}"),
                          SizedBox(height: 6),
                          if (item.hargaJual != null &&
                              item.hargaJual!.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: item.hargaJual!.map((h) {
                                return Text(
                                  "${h.tipe?.nama ?? '-'} : ${formatRupiah(h.harga!)}",
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    ),
                  );
                } else {
                  if (controller.hasMoreStokMobil.value) {
                    controller.loadMoreStokMobil(gudang.id!);
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
          ],
        );
      }),
    );
  }
}
