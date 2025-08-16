import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/analisis_controller.dart';
import 'package:mobile_erp/helpers/CurrencyInputFormatter.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/type_konsumen.dart';

class AddAnalisisScreen extends StatelessWidget {
  const AddAnalisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnalisisController controller = Get.put(AnalisisController());
    controller.loadTypeKonsumen();
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
                SizedBox(height: 25),
                TextFormField(
                  controller: controller.namaCostumer,
                  decoration: InputDecoration(
                    labelText: "Nama Customer / Konsumen",
                    border: OutlineInputBorder(), // opsional agar rapi
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama customer tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 17),
                TextFormField(
                  controller: controller.kecamatan,
                  decoration: InputDecoration(labelText: "Kecamatan"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Kecamatan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 17),
                TextFormField(
                  controller: controller.tanggal,
                  readOnly: true,
                  onTap: () => controller.setTanggal(context),
                  decoration: const InputDecoration(
                    hintText: 'Pilih Tanggal',
                    labelText: 'Pilih Tanggal',
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
                  if (controller.isLoadingTypeKonsumen.value) {
                    return CircularProgressIndicator();
                  }
                  if (controller.listKonsumen.isEmpty) {
                    return ElevatedButton(
                      onPressed: () {
                        controller.loadTypeKonsumen();
                      },
                      child: Text('Muat ulang'),
                    );
                  }
                  return DropdownButtonFormField<TypeKonsumenModel>(
                    isExpanded: true,
                    value: controller.selectedTypeKonsumen.value,
                    hint: Text('Pilih Tipe Konsumen'),
                    items: controller.listKonsumen.map((tipe) {
                      return DropdownMenuItem<TypeKonsumenModel>(
                        value: tipe,
                        child: Text(tipe.nama),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedTypeKonsumen.value = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Harap pilih tipe konsumen';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: 17),
                TextFormField(
                  maxLines: 2,
                  controller: controller.alamat,
                  decoration: InputDecoration(labelText: "Alamat"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                Text(
                  'Brand dan Harga',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controller.namaBrand,
                  decoration: InputDecoration(labelText: "Brand"),
                ),
                SizedBox(height: 17),
                TextField(
                  controller: controller.hargaBrand,
                  decoration: InputDecoration(labelText: "Harga"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                    onPressed: () {
                      String rawText = controller.hargaBrand.text
                          .trim()
                          .replaceAll('.', '');
                      final brand = controller.namaBrand.text;
                      int harga = int.tryParse(rawText) ?? 0;
                      if (brand.isNotEmpty && harga > 0) {
                        controller.tambahBrand(brand, harga);
                        controller.namaBrand.clear();
                        controller.hargaBrand.clear();
                      }
                    },
                    child: Text(
                      "Tambah Brand",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Card(
                    elevation: 0,
                    color: Colors.grey[100],
                    child: ListView.builder(
                      itemCount: controller.listBrands.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = controller.listBrands[index];
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              title: Text(item["brand"]),
                              subtitle: Text(formatRupiah(item["harga"])),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => controller.hapusBrand(index),
                              ),
                            ),
                            Divider(color: Colors.grey[300]),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 17),
                SizedBox(
                  child: DefaultButton(
                    text: "Simpan",
                    press: () {
                      if (controller.formKeyAdd.currentState!.validate()) {
                        final payload = [
                          {
                            "tanggal": controller.selectTanggal.toString(),
                            "karyawan_id": controller.karyawanId,
                            "tipe_konsumen":
                                controller.selectedTypeKonsumen.value!.id,
                            "nama_costumer": controller.namaCostumer.text,
                            "kecamatan": controller.kecamatan.text,
                            "brand": controller.listBrands,
                            "alamat": controller.alamat.text,
                          },
                        ];

                        // print(payload);
                        controller.addAnalisis(payload);
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
