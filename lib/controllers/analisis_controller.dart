import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/services/analisis_services.dart';

class AnalisisController extends GetxController {
  late ScrollController scrollController;

  var dataList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var order = 'desc';
  var start = 0;
  final int length = 3;

  late final String token;
  late final int karyawanId;

  @override
  void onInit() {
    super.onInit();
    final box = GetStorage();
    token = box.read(Base.token);
    final user = json.decode(box.read(Base.user));
    karyawanId = user['karyawan']['id'];

    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    loadMore(); // initial load
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      // trigger lebih awal sebelum mentok
      loadMore();
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> refreshData() async {
    start = 0;
    hasMore.value = true;
    dataList.clear();
    await loadMore();
  }

  Future<void> loadMore() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    final params = {
      'start': start.toString(),
      'length': length.toString(),
      'order': order,
      'karyawan_id': karyawanId.toString(),
    };

    try {
      final response = await AnalisisServices().analisisIndex(token, params);

      if (response.statusCode == 200 && response.body != null) {
        final List<dynamic> rawData = response.body['data'];

        if (rawData.isEmpty) {
          hasMore.value = false;
        } else {
          dataList.addAll(rawData.cast<Map<String, dynamic>>());
          start += length;
        }
      } else if (response.statusCode == 401) {
        Get.defaultDialog(
          barrierDismissible: false,
          titlePadding: EdgeInsets.only(top: 20),
          title: 'Login kembali',
          middleText: response.body['message'].toString(),
          textConfirm: 'Oke',
          contentPadding: EdgeInsets.only(bottom: 20, top: 10),
          confirmTextColor: Colors.white,
          buttonColor: kPrimaryColor,
          onConfirm: () {
            Get.offAllNamed(RouteName.login);
          },
        );
      } else {
        hasMore.value = false;
        Get.snackbar('Gagal', 'Gagal memuat data (${response.statusCode})');
      }
    } catch (e) {
      hasMore.value = false;
      Get.snackbar('Error', 'Terjadi kesalahan: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
