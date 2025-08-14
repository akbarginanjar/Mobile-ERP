import 'dart:convert';

import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/ajuan_barang_model.dart';

class RincianAjuanBarangScreen extends StatelessWidget {
  final AjuanBarangModel ajuanBarang;
  const RincianAjuanBarangScreen({super.key, required this.ajuanBarang});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.put(AjuanBarangController());
    controller.loadDetail(ajuanBarang.id.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Rincian Ajuan Barang",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('KODE AJUAN BARANG', style: TextStyle(fontSize: 10)),
                  Text(
                    '${ajuanBarang.no}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Pengajuan'),
                      Text(
                        formatTanggal(ajuanBarang.tanggalWaktu.toString()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama Sales'),
                      Text(
                        '${ajuanBarang.sales!.namaLengkap}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('KETERANGAN', style: TextStyle(fontSize: 10)),
                  Text('${ajuanBarang.keterangan}'),
                ],
              ),
            ),
            Divider(thickness: 7, color: Colors.grey[300]),
            Obx(() {
              if (controller.isLoadingDetail.value) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (controller.detail.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: Text("Tidak ada data")),
                );
              }

              final request = controller.detail['request'];
              final sales = controller.detail['sales'];
              final rute = controller.detail['rute'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rute Ajuan Barang',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Badge(
                          text: '${rute?['nama_rute']}',
                          backgroundColor: Colors.green[800]!,
                          borderRadius: 7,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Divider(thickness: 7, color: Colors.grey[300]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Ajuan Barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 0,
                            ),
                            child: ListView.builder(
                              itemCount: request['rincian_barang'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: EdgeInsets.only(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 10,
                                  ),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BARANG',
                                          style: TextStyle(fontSize: 9),
                                        ),
                                        Text(
                                          '${request['rincian_barang'][index]['barang'] ?? '-'}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'REQUEST SALES',
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Text(
                                                  '${request['rincian_barang'][index]['qty_request']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'REQUEST SPV',
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Text(
                                                  '${request['rincian_barang'][index]['tujuan'][0]['qty_real']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'SATUAN',
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Text(
                                                  '${request['rincian_barang'][index]['barang'] ?? '-'}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'KETERANGAN',
                                          style: TextStyle(fontSize: 9),
                                        ),
                                        Text(
                                          '${request['rincian_barang'][index]['keterangan'] ?? '-'}',
                                          style: TextStyle(),
                                        ),
                                        // TextFormField(
                                        //   decoration: InputDecoration(
                                        //     label: Text('Keterangan'),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
