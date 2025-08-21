import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';

class StokBarangMobilService extends GetConnect implements GetxService {
  Future<Response> stokMobilIndex(tokens, params) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(Base.url + Base.gudangGet, headers: header, query: params);
  }

  Future<Response> stokMobilDetail(tokens, params) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(
      Base.url + Base.gudangStockMobilGet,
      headers: header,
      query: params,
    );
  }
}
