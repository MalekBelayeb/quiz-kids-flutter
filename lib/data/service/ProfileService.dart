import 'dart:convert';
import 'dart:io';
import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/data/models/User.dart';
import 'package:quiz_flutter/utils/Consts.dart';

class ProfileService {
  getMyProfile(String userId) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse('${Consts.getUserById}${userId}'));
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        print(stringData);
        return UserBodyRes.fromJson(json.decode(stringData));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        return ErrorBodyRes.fromJson(json.decode(stringData));
      }
    } catch (errror) {}
  }

  getBadges() async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse('${Consts.getAllBadges}'));

      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return GetAllBadgeBodyRes.fromJson(json.decode(stringData));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        return ErrorBodyRes.fromJson(json.decode(stringData));
      }
    } catch (errror) {}
  }
}
