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

  Future<Response> ajuanBarangDetail(tokens, params, id) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(
      Base.url + Base.requestBarangDetail + id,
      headers: header,
      query: params,
    );
  }

  Future<Response> addAjuanBarang(tokens, body) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return post(Base.url + Base.requestBarangPost, headers: header, body);
  }

  Future<Response> rute(tokens) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get('${Base.url}/v1/rute', headers: header);
  }

  Future<Response> penyimpananBarangIndex(tokens) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return get(Base.url + Base.gudangPenyimpananGet, headers: header);
  }

  Future<Response> addRincianAjuanBarang(tokens, body) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Author': 'bearer $tokens',
    };
    return post(Base.url + Base.requestBarangRinciPost, headers: header, body);
  }
}
