import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/data/service/CategoryService.dart';
import 'package:quiz_flutter/model/CategoryModel.dart';

class CategoryController {
  final CategoryService categoryService = CategoryService();

  static final instance = CategoryController();

  Future<List<CategoryModel>?> getAllCategories() async {
    var res = await categoryService.getAllCategory();

    if (res is GetAllCategorySuccessRes) {
      List<CategoryModel> result = res.categoryList
          .map((e) => CategoryModel(name: e.name!, image: e.image!))
          .toList();

      return result;
    } else {
      return null;
    }
  }
}
