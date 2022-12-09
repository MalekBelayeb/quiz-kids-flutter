class BadgeBodyRes {
  String? id;
  String? name;
  String? image;
  int? scoreCriteria;

  BadgeBodyRes({this.id, this.name, this.image, this.scoreCriteria});
  factory BadgeBodyRes.fromJson(dynamic json) {
    return BadgeBodyRes(
        id: json['_id'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        scoreCriteria: json['scoreCriteria'] as int);
  }
}
