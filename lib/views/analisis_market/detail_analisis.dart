import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
          ],
        ),
      ),
    );
  }
}
