import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';

class AuthServices extends GetConnect implements GetxService {
  Future<Response> login(body) {
    final header = {'device': 'mobile', 'Secret': Base.secretKey};
    return post(Base.url + Base.login, headers: header, body);
  }

  Future<Response> logout(tokens) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return post(Base.url + Base.logout, headers: header, []);
  }

  Future<Response> refresh(tokens) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return post(Base.url + Base.refresh, headers: header, []);
  }

  Future<Response> getToken(tokens) {
    final header = {
      'device': 'mobile',
      'Secret': Base.secretKey,
      'Authorization': 'bearer $tokens',
    };
    return post(Base.url + Base.getToken, headers: header, []);
  }
}
