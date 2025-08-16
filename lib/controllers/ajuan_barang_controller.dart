import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/ajuan_barang_model.dart';
import 'package:mobile_erp/models/rute_model.dart';
import 'package:mobile_erp/services/ajuan_barang_service.dart';

class AjuanBarangController extends GetxController {
  final _service = AjuanBarangService();

  var items = <AjuanBarangModel>[].obs;
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var hasMore = true.obs;
  late final String token;
  late final int karyawanId;
  late final int gudangId;

  int start = 0;
  int length = 5;
  String order = "desc";

  @override
  void onInit() {
    super.onInit();
    token = GetStorage().read(Base.token);
    final user = json.decode(GetStorage().read(Base.user));
    karyawanId = user['karyawan']['id'];
    final gudang = json.decode(GetStorage().read(Base.gudang));
    gudangId = gudang['id'];
    loadData();
  }

  Future<void> loadData({bool isRefresh = false}) async {
    if (isRefresh) {
      start = 0;
      hasMore.value = true;
      items.clear();
    }

    if (!hasMore.value) return;

    if (start == 0) {
      isLoading.value = true;
    } else {
      isMoreLoading.value = true;
    }

    final params = {
      'length': length.toString(),
      'order': order,
      'sales_id': karyawanId.toString(),
      'start': start.toString(),
    };

    try {
      final res = await _service.ajuanBarangIndex(token, params);
      if (res.statusCode == 200) {
        final List<dynamic> dataList = res.body['data'] ?? [];
        final List<AjuanBarangModel> newItems = dataList
            .map((e) => AjuanBarangModel.fromJson(e))
            .toList();

        if (newItems.length < length) {
          hasMore.value = false;
        }

        items.addAll(newItems);
        start += length;
      } else if (res.statusCode == 401) {
        SessionExpiredDialog.show();
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      hasMore.value = false;
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }

  Future<void> onRefresh() async {
    await loadData(isRefresh: true);
  }

  void loadMore() {
    if (!isMoreLoading.value && hasMore.value) {
      loadData();
    }
  }

  //DETAIL AJUAN BARANG
  var isLoadingDetail = false.obs;
  var detail = <String, dynamic>{}.obs;

  Future<void> loadDetail(String requestId) async {
    try {
      isLoadingDetail.value = true;
      final params = {
        'request_id': requestId,
        'sales_id': karyawanId.toString(),
      };

      final res = await AjuanBarangService().ajuanBarangDetail(
        token,
        params,
        requestId,
      );

      if (res.statusCode == 200 && res.body != null) {
        if (res.body is Map) {
          // ✅ langsung assign kalau object
          detail.value = res.body as Map<String, dynamic>;
        } else if (res.body is List && res.body.isNotEmpty) {
          // ✅ ambil first element kalau list
          detail.value = res.body.first as Map<String, dynamic>;
        } else {
          detail.value = {};
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingDetail.value = false;
    }
  }

  //ADD AJUAN BARANG
  var selectTanggal = Rxn<DateTime>();
  GlobalKey<FormState> formKeyAdd = GlobalKey<FormState>();
  TextEditingController keterangan = TextEditingController();
  final tanggal = TextEditingController();
  var isLoadingRute = false.obs;
  var listRute = <RuteModel>[].obs;
  var selectedRute = <RuteModel>[].obs;

  void clearAddAjuanBarang() {
    selectTanggal.value = null;
    tanggal.clear();
    keterangan.clear();
    selectedRute.clear();
  }

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

  Future<void> loadRute() async {
    try {
      isLoadingRute.value = true;
      final response = await AjuanBarangService().rute(token);

      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        final ruteList = data.map((e) => RuteModel.fromJson(e)).toList();
        listRute.value = ruteList;
      } else if (response.statusCode == 401) {
        SessionExpiredDialog.show();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingRute.value = false;
    }
  }

  void toggleRute(RuteModel rute) {
    if (selectedRute.contains(rute)) {
      selectedRute.remove(rute);
    } else {
      selectedRute.add(rute);
    }
  }

  List<Map<String, dynamic>> get selectedMappedRute {
    return selectedRute
        .map((rute) => {"value": rute.id, "text": rute.namaRute})
        .toList();
  }

  Future<void> addAjuanBarang(
    List<Map<String, dynamic>> payload,
    status,
  ) async {
    try {
      if (status == 1) {
        EasyLoading.show(status: 'Menyimpan data...');
      } else {
        EasyLoading.show(status: 'Menghapus data...');
      }
      final response = await AjuanBarangService().addAjuanBarang(
        token,
        jsonEncode(payload),
      );
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Get.back(result: true);
        if (status == 1) {
          EasyLoading.showSuccess('Data berhasil disimpan');
        } else {
          EasyLoading.showSuccess('Data berhasil dihapus');
        }
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
