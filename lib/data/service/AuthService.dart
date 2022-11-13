import 'dart:convert';
import 'dart:io';

import 'package:quiz_flutter/data/models/Auth.dart';

import '../../utils/Consts.dart';

class AuthService {
  Future<dynamic> login(data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse(Consts.loginUrl));
      request.headers.set('content-type', 'application/json');

      request.add(utf8.encode(json.encode(data)));

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return SigninSuccessRes.fromJson(json.decode(stringData));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        return SigninErrorRes.fromJson(json.decode(stringData));
      }
    } catch (errror) {
      print(errror);
    }
  }

  Future<dynamic> signup(data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse(Consts.signupUrl));
      request.headers.set('content-type', 'application/json');

      request.add(utf8.encode(json.encode(data)));

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return SigninSuccessRes.fromJson(json.decode(stringData));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        return SigninErrorRes.fromJson(json.decode(stringData));
      }
    } catch (errror) {
      print(errror);
    }
  }
}
