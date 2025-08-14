import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/ajuan_barang_model.dart';
import 'package:mobile_erp/services/ajuan_barang_service.dart';

class AjuanBarangController extends GetxController {
  final _service = AjuanBarangService();

  var items = <AjuanBarangModel>[].obs;
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var hasMore = true.obs;
  late final String token;
  late final int karyawanId;

  int start = 0;
  int length = 6;
  String order = "desc";

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
  var detail = {}.obs;

  Future<void> loadDetail(String requestId) async {
    try {
      isLoadingDetail.value = true;
      final params = {
        'request_id': requestId,
        'sales_id': karyawanId.toString(),
      };

      final res = await AjuanBarangService().ajuanBarangDetail(token, params);

      final body = res.body;

      if (res.statusCode == 200 && body != null) {
        if (body['data'] is List && body['data'].isNotEmpty) {
          detail.value = body['data'][0]; // Map
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
}
