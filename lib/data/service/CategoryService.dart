import 'dart:convert';
import 'dart:io';

import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/utils/Consts.dart';

class CategoryService {
  getAllCategory() async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse(Consts.getAllCategories));

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return GetAllCategorySuccessRes.fromJson(json.decode(stringData));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        return ErrorBodyRes.fromJson(json.decode(stringData));
      }
    } catch (errror) {}
  }
}
