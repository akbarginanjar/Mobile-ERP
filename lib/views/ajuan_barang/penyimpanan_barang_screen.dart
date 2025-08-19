import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';

class PenyimpananBarangScreen extends StatelessWidget {
  final int ajuanBarangId;
  const PenyimpananBarangScreen({super.key, required this.ajuanBarangId});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.find();
    controller.loadPenyimpananBarang();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        surfaceTintColor: kPrimaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Penyimpanan Barang",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.isLoadingPenyimpanan.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.listBarang.isEmpty) {
          return const Center(child: Text("Belum ada data barang"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadPenyimpananBarang(),
          child: ListView.builder(
            itemCount: controller.listBarang.length,
            itemBuilder: (context, index) {
              final barang = controller.listBarang[index];

              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, // warna border
                      width: 0.5, // ketebalan border
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    barang['nama'].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('JUMLAH STOK', style: TextStyle(fontSize: 10)),
                      Text(
                        '${barang['stok']} ${barang['satuan'] ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.green[800],
                      size: 30,
                    ),
                    onPressed: () {
                      final requestController = TextEditingController();
                      final ketController = TextEditingController();

                      Get.defaultDialog(
                        title: "Tambah Barang",
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NAMA BARANG', style: TextStyle(fontSize: 8)),
                            Text(
                              '${barang['nama']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text('STOK', style: TextStyle(fontSize: 8)),
                            Text(
                              '${barang['stok']} ${barang['satuan'] ?? ''}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: requestController,
                              decoration: InputDecoration(labelText: "Request"),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: ketController,
                              decoration: InputDecoration(
                                labelText: "Keterangan",
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        actions: [
                          DefaultButton(
                            text: "Simpan",
                            color: kPrimaryColor,
                            press: () {
                              final request =
                                  int.tryParse(requestController.text) ?? 0;
                              final ket = ketController.text;

                              controller.tambahBarang(
                                barang,
                                request,
                                ket,
                                ajuanBarangId,
                              );

                              Get.back();
                              Get.back();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
