import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';

class AjuanBarangService extends GetConnect implements GetxService {
  Future<Response> ajuanBarangIndex(tokens, params) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(
      Base.url + Base.requestBarangGet,
      headers: header,
      query: params,
    );
  }
}
