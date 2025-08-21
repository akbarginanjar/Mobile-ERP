import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/gudang_model.dart';
import 'package:mobile_erp/services/stok_barang_mobil_service.dart';

class StokBarangMobilController extends GetxController {
  late final String token;
  late final int karyawanId;
  var items = <GudangModel>[].obs;
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var hasMore = true.obs;

  int start = 0;
  int length = 5;
  int jenis = 2;

  @override
  void onInit() {
    super.onInit();
    token = GetStorage().read(Base.token);
    final user = json.decode(GetStorage().read(Base.user));
    karyawanId = user['karyawan']['id'];
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
      'jenis': jenis.toString(),
      'karyawan_id': karyawanId.toString(),
      'length': length.toString(),
      'start': start.toString(),
    };

    try {
      final res = await StokBarangMobilService().stokMobilIndex(token, params);
      print(res.statusCode);
      if (res.statusCode == 200) {
        final List<dynamic> dataList = res.body['data'] ?? [];
        final List<GudangModel> newItems = dataList
            .map((e) => GudangModel.fromJson(e))
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
}
