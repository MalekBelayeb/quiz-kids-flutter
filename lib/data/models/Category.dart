class CategoryBodyRes {
  String? id;
  String? name;
  String? image;

  CategoryBodyRes({this.id, this.name, this.image});
  factory CategoryBodyRes.fromJson(dynamic json) {
    return CategoryBodyRes(
      id: json['_id'] as String,
      name: json['category'] as String,
      image: json['image'] as String,
    );
  }
}

class GetAllCategorySuccessRes {
  bool success;
  List<CategoryBodyRes> categoryList;
  GetAllCategorySuccessRes({required this.success, required this.categoryList});
  factory GetAllCategorySuccessRes.fromJson(dynamic json) {
    return GetAllCategorySuccessRes(
        success: json['success'] as bool,
        categoryList: List<CategoryBodyRes>.from(
            (json['categories'] as List<dynamic>)
                .map((e) => CategoryBodyRes.fromJson(e))).toList());
  }
}

class ErrorBodyRes {
  bool? success;
  String? message;

  ErrorBodyRes({this.success, this.message});
  factory ErrorBodyRes.fromJson(dynamic json) {
    return ErrorBodyRes(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}
