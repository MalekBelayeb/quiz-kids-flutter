class BadgeBodyRes {
  String? id;
  String? name;
  String? image;
  int? scoreCriteria;
  bool? owned = false;

  BadgeBodyRes({this.id, this.name, this.image, this.scoreCriteria});
  factory BadgeBodyRes.fromJson(dynamic json) {
    return BadgeBodyRes(
        id: json['_id'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        scoreCriteria: json['scoreCriteria'] as int);
  }
}

class GetAllBadgeBodyRes {
  bool? success;
  List<BadgeBodyRes>? badges = [];

  GetAllBadgeBodyRes({this.success, this.badges});
  factory GetAllBadgeBodyRes.fromJson(dynamic json) {
    return GetAllBadgeBodyRes(
        success: json['success'] as bool,
        badges: List<BadgeBodyRes>.from((json['badges'] as List<dynamic>)
            .map((e) => BadgeBodyRes.fromJson(e))).toList());
  }
}

class UserBodyRes {
  String? id;
  String? firstname;
  String? lastname;
  int? score;
  List<BadgeBodyRes>? badges = [];

  UserBodyRes(
      {this.id, this.firstname, this.lastname, this.score, this.badges});
  factory UserBodyRes.fromJson(dynamic json) {
    return UserBodyRes(
        id: json['_id'] as String,
        firstname: json['firstname'] as String,
        lastname: json['lastname'] as String,
        score: json['globalScore'] as int,
        badges: List<BadgeBodyRes>.from((json['badges'] as List<dynamic>)
            .map((e) => BadgeBodyRes.fromJson(e))).toList());
  }
}
