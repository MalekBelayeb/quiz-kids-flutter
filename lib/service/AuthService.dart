import 'dart:convert';
import 'dart:io';

import '../utils/Consts.dart';

class AuthService {
  static Future<dynamic> login(data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse(Consts.loginUrl));
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      print(response);
    } catch (errror) {
      print(errror);
    }
  }

  // Future<dynamic> signUp() {}
}
