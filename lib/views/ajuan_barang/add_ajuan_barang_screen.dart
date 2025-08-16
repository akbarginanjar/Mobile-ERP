import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddAjuanBarangScreen extends StatelessWidget {
  const AddAjuanBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.put(AjuanBarangController());
    controller.loadRute();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        surfaceTintColor: kPrimaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Tambah Baru",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: Form(
        key: controller.formKeyAdd,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(PhosphorIcons.package()),
                    SizedBox(width: 5),
                    Text(
                      'Data Ajuan Barang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.tanggal,
                  readOnly: true,
                  onTap: () => controller.setTanggal(context),
                  decoration: const InputDecoration(
                    hintText: 'Pilih Tanggal',
                    labelText: 'Tanggal Ajuan',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tanggal tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 17),
                Obx(() {
                  if (controller.isLoadingRute.value) {
                    return const CircularProgressIndicator();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.grey[300]!),
                          ),
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                child: Obx(() {
                                  return ListView(
                                    shrinkWrap: true,
                                    children: controller.listRute.map((rute) {
                                      final isSelected = controller.selectedRute
                                          .contains(rute);
                                      return CheckboxListTile(
                                        title: Text(rute.namaRute),
                                        value: isSelected,
                                        onChanged: (val) {
                                          controller.toggleRute(rute);
                                        },
                                      );
                                    }).toList(),
                                  );
                                }),
                              ),
                            );
                          },
                          leading: Icon(Icons.route),
                          title: Text('Pilih Rute'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // ✅ Badge / Chip untuk rute yang sudah dipilih
                      Obx(() {
                        if (controller.selectedRute.isEmpty) {
                          return const Text("Belum ada rute dipilih");
                        }
                        return Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: controller.selectedRute.map((rute) {
                            return Chip(
                              label: Text(rute.namaRute),
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () => controller.toggleRute(rute),
                              backgroundColor: Colors.blue.shade100,
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  );
                }),
                SizedBox(height: 17),
                TextFormField(
                  maxLines: 2,
                  controller: controller.keterangan,
                  decoration: InputDecoration(labelText: "Keterangan"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Keterangan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 17),
                SizedBox(
                  child: DefaultButton(
                    text: "Simpan",
                    press: () {
                      if (controller.formKeyAdd.currentState!.validate()) {
                        final payload = [
                          {
                            "sales_id": controller
                                .karyawanId, // karyawan_id ketika login
                            "tanggal_waktu": controller.selectTanggal
                                .toString(),
                            "keterangan": controller.keterangan.text,
                            "rutes": controller.selectedMappedRute,
                            "id_gudang": controller.gudangId,
                            "status": 1, // status pending
                          },
                        ];

                        // print(payload);
                        if (controller.selectedMappedRute.isEmpty) {
                          EasyLoading.showToast('Pilih Rute');
                        } else {
                          // status 1 = add, 2 = delete
                          controller.addAjuanBarang(payload, 1);
                        }
                      }
                    },
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 17),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
