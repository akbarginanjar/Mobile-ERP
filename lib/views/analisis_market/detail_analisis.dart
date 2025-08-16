import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/helpers/constants.dart';

class DetailAnalisisScreen extends StatelessWidget {
  const DetailAnalisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Detail Analisis Market",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal : ${formatTanggal(data['tanggal'])}',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Sales : ${data['karyawan']?['nama_lengkap'] ?? '-'}',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Tipe : ${data['tipe']['nama'] ?? '-'}',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Konsumen : ${data['nama_costumer'] ?? '-'}',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Kecamatan : ${data['kecamatan'] ?? '-'}',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Alamat : ${data['alamat'] ?? '-'}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 20),
            Text(
              'Brand',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
              },
              children: [
                // Header
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Brand',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Harga',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // Data Rows
                ...data['brand'].map((item) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item['brand']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(formatRupiah(item['harga'])),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                  side: BorderSide(color: Colors.red[800]!),
                ),
              ),
              onPressed: () {
                Get.defaultDialog(
                  titlePadding: EdgeInsets.only(top: 20),
                  title: "Hapus Analisis Market?",
                  titleStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  content: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Apakah anda ingin menghapus Analisis Market ini?',
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
                      text: "Hapus",
                      press: () async {
                        Get.back();
                        final payload = [
                          // {"id": ajuanBarang.id, "fungsi": 2},
                        ];
                        //status 1 = add, 2 = delete
                        // controller.addAjuanBarang(payload, 2);
                      },
                      color: Colors.red,
                    ),
                  ],
                );
              },
              child: Text(
                'Hapus Analisis Market',
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
