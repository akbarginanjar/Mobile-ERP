import 'dart:convert';

import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/ajuan_barang_model.dart';
import 'package:mobile_erp/views/ajuan_barang/penyimpanan_barang_screen.dart';

class RincianAjuanBarangScreen extends StatelessWidget {
  final AjuanBarangModel ajuanBarang;
  const RincianAjuanBarangScreen({super.key, required this.ajuanBarang});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.put(AjuanBarangController());
    controller.loadDetail(ajuanBarang.id.toString());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        controller.selectedBarang.clear(); // 🚀 clear state
        controller.selectedBarangApi.clear(); // 🚀 clear state
        return true; // lanjutkan back
      },
      child: Scaffold(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
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
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: controller.detail['rute']
                                .map<Widget>(
                                  (r) => BadgeComponent(
                                    text: '${r['rute']['nama_rute']}',
                                    backgroundColor: Colors.green[800]!,
                                    borderRadius: 7,
                                  ),
                                )
                                .toList(),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rincian Ajuan Barang',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              if (ajuanBarang.statusData!.dataStatus == 1)
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    foregroundColor: Colors.deepOrange,
                                  ),
                                  onPressed: () {
                                    Get.to(
                                      PenyimpananBarangScreen(
                                        ajuanBarangId: ajuanBarang.id!,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Tambah',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Card(
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount: controller
                                        .detail['rincian_barang']
                                        .length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
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
                                                '${controller.detail['rincian_barang'][index]['barang']['nama'] ?? '-'}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'REQUEST SALES',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${controller.detail['rincian_barang'][index]['qty_request']}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'REQUEST SPV',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        (controller.detail['rincian_barang'][index]['tujuan']
                                                                    is List &&
                                                                (controller.detail['rincian_barang'][index]['tujuan']
                                                                        as List)
                                                                    .isNotEmpty)
                                                            ? controller
                                                                  .detail['rincian_barang'][index]['tujuan'][0]['qty_real']
                                                                  .toString()
                                                            : '-',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'SATUAN',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${controller.detail['rincian_barang'][index]['barang']['satuan']['satuan'] ?? '-'}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                '${controller.detail['rincian_barang'][index]['keterangan'] ?? '-'}',
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
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.selectedBarang.length,
                                    itemBuilder: (context, index) {
                                      final barang =
                                          controller.selectedBarang[index];

                                      return Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'BARANG',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${barang['nama']}',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // 🔥 Tombol hapus
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      controller.selectedBarang
                                                          .removeAt(index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'REQUEST SALES',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${barang['request'] ?? '-'}',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'REQUEST SPV',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '-',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'SATUAN',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${barang['satuan'] ?? '-'}',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'KETERANGAN',
                                                style: TextStyle(fontSize: 9),
                                              ),
                                              Text(barang['keterangan'] ?? '-'),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              if (ajuanBarang.statusData!.dataStatus == 1)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0,
                  ),
                  child: DefaultButton(
                    text: 'Kirim Ajuan Barang',
                    press: () {
                      Get.defaultDialog(
                        titlePadding: EdgeInsets.only(top: 20),
                        title: "Apakah anda ingin\n mengirim barang ini?",
                        titleStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        content: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Pastikan barang yang dipilih sudah tepat.',
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
                            text: "Kirim",
                            press: () async {
                              if (controller.selectedBarangApi.isEmpty) {
                                EasyLoading.showToast(
                                  'Tidak ada perubahan pada barang',
                                );
                              } else {
                                Get.back();
                                //status 1 = add, 2 = delete
                                controller.addRincianAjuanBarang(
                                  controller.selectedBarangApi,
                                  1,
                                );
                              }
                            },
                            color: Colors.lightBlue,
                          ),
                        ],
                      );
                    },
                    color: Colors.lightBlue,
                  ),
                )
              else if (ajuanBarang.statusData!.dataStatus == 3)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0,
                  ),
                  child: Obx(
                    () => controller.isLoadingDetail.value
                        ? Center(child: CircularProgressIndicator())
                        : DefaultButton(
                            text: 'Barang Diterima',
                            press: () {
                              Get.defaultDialog(
                                titlePadding: EdgeInsets.only(top: 20),
                                title:
                                    "Apakah anda ingin\n menerima barang ini?",
                                titleStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                content: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Pastikan barang yang dipilih sudah tepat.',
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
                                    text: "Barang Diterima",
                                    press: () async {
                                      Get.back();
                                      final payload = [];

                                      controller.detail['rincian_barang']
                                          .forEach((barang) {
                                            payload.add({
                                              "id_request_tujuan":
                                                  barang['tujuan'][0]['id'],
                                            });
                                          });

                                      controller.approveTerimaAjuanBarang(
                                        payload,
                                      );
                                    },
                                    color: Colors.lightBlue,
                                  ),
                                ],
                              );
                            },
                            color: Colors.lightBlue,
                          ),
                  ),
                ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                child: ElevatedButton(
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
                      title: "Hapus Ajuan Barang?",
                      titleStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      content: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Apakah anda ingin menghapus Ajuang Barang ini?',
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
                              {"id": ajuanBarang.id, "fungsi": 2},
                            ];
                            //status 1 = add, 2 = delete
                            controller.addAjuanBarang(payload, 2);
                          },
                          color: Colors.red,
                        ),
                      ],
                    );
                  },
                  child: Text(
                    'Hapus Ajuan Barang',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
