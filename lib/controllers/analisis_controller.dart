import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/controllers/splash_controller.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/type_konsumen.dart';
import 'package:mobile_erp/services/analisis_service.dart';

class AnalisisController extends GetxController {
  late ScrollController scrollController;

  final box = GetStorage();
  var dataList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var order = 'desc';
  var start = 0;
  final int length = 3;
  late final String token;
  late final int karyawanId;
  GlobalKey<FormState> formKeyAdd = GlobalKey<FormState>();
  TextEditingController namaCostumer = TextEditingController();
  TextEditingController kecamatan = TextEditingController();
  var selectTanggal = Rxn<DateTime>();
  final tanggal = TextEditingController();
  var listKonsumen = <TypeKonsumenModel>[].obs;
  var selectedTypeKonsumen = Rxn<TypeKonsumenModel>();
  var isLoadingTypeKonsumen = false.obs;
  final selectTypeKonsumen = Rxn<Map<String, dynamic>>();
  TextEditingController alamat = TextEditingController();
  final TextEditingController namaBrand = TextEditingController();
  final TextEditingController hargaBrand = TextEditingController();
  var listBrands = <Map<String, dynamic>>[].obs;

  void setTanggal(BuildContext context) async {
    DateTime initialDate = selectTanggal.value ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectTanggal.value = picked;
      tanggal.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Future<void> loadTypeKonsumen() async {
    try {
      isLoadingTypeKonsumen.value = true;
      final response = await AnalisisServices().typeKonsumen(token);
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        final tipeList = data
            .map((e) => TypeKonsumenModel.fromJson(e))
            .toList();
        listKonsumen.value = tipeList;

        // ✅ Delay untuk menghindari setState during build
        if (tipeList.isNotEmpty) {
          Future.delayed(Duration.zero, () {
            selectedTypeKonsumen.value = tipeList.first;
          });
        }
      } else if (response.statusCode == 401) {
        SessionExpiredDialog.show();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingTypeKonsumen.value = false;
    }
  }

  void setSelectTypeKonsumen(Map<String, dynamic> typeKonsumen) {
    selectTypeKonsumen.value = typeKonsumen;
  }

  void tambahBrand(String brand, int harga) {
    listBrands.add({"brand": brand, "harga": harga});
  }

  void hapusBrand(int index) {
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      title: "Hapus Brand?",
      titleStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      content: const Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Apakah anda ingin mennghapus brand?',
          style: TextStyle(fontSize: 12),
        ),
      ),
      contentPadding: EdgeInsets.only(bottom: 20, top: 10, left: 20, right: 20),
      actions: [
        DefaultButtonSecond(
          text: "Batal",
          press: () {
            Get.back();
          },
        ),
        DefaultButton(
          text: "Hapus",
          press: () {
            listBrands.removeAt(index);
            Get.back();
          },
          color: Colors.red,
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
    final box = GetStorage();
    token = box.read(Base.token);
    final user = json.decode(box.read(Base.user));
    karyawanId = user['karyawan']['id'];

    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    loadAnalisis();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      // trigger lebih awal sebelum mentok
      loadAnalisis();
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> refreshData() async {
    // Reset pagination
    start = 0;
    hasMore.value = true;
    isLoading.value = false;
    dataList.clear(); // Hapus data lama
    update(); // Optional: pakai kalau bukan pakai Obx()

    await loadAnalisis(); // Mulai fetch data lagi
  }

  Future<void> loadAnalisis() async {
    // Jika sedang loading atau tidak ada lagi data, hentikan
    if (isLoading.value || !hasMore.value) return;

    // Tampilkan indikator loading
    isLoading.value = true;

    final params = {
      'start': start.toString(),
      'length': length.toString(),
      'order': order,
      'karyawan_id': karyawanId.toString(),
    };

    try {
      final response = await AnalisisServices().analisisIndex(token, params);
      print(response.statusCode);
      if (response.statusCode == null || response.body == null) {
        throw Exception('Gagal memuat data');
      } else if (response.statusCode == 401) {
        return SessionExpiredDialog.show();
      }

      final List<dynamic> rawData = response.body['data'];
      if (rawData.isEmpty) {
        hasMore.value = false;
      } else {
        dataList.addAll(rawData.cast<Map<String, dynamic>>());
        start += length;
      }

      // Berhasil, set isLoading ke false
      isLoading.value = false;
    } catch (e) {
      await loadAnalisis();
    }
  }

  Future<void> addAnalisis(List<Map<String, dynamic>> payload) async {
    try {
      EasyLoading.show(status: 'Menyimpan data...');
      final response = await AnalisisServices().analisisPost(
        token,
        jsonEncode(payload),
      );
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Get.back(result: true);
        EasyLoading.showSuccess('Data berhasil disimpan');
      } else if (response.statusCode == 401) {
        EasyLoading.dismiss();
        SessionExpiredDialog.show();
      } else {
        EasyLoading.dismiss();
        Get.snackbar('Gagal', 'Gagal mengirim data: ${response.bodyString}');
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', e.toString());
    }
  }
}
