import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';

class AnalisisServices extends GetConnect implements GetxService {
  Future<Response> analisisIndex(tokens, params) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(Base.url + Base.analisisGet, headers: header, query: params);
  }

  Future<Response> analisisPost(tokens, body) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return post(Base.url + Base.analisisPost, headers: header, body);
  }

  Future<Response> analisisBrandIndex(tokens, params) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return get(
      Base.url + Base.analisisBrandGet,
      headers: header,
      query: params,
    );
  }

  Future<Response> analisisBrandPost(tokens, body) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return post(Base.url + Base.analisisBrandPost, headers: header, body);
  }
}
