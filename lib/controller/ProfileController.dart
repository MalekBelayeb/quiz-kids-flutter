import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/data/models/User.dart';
import 'package:quiz_flutter/data/service/ProfileService.dart';

class ProfileController {
  final ProfileService profileService = ProfileService();
  ProfileController() {}
  static final instance = ProfileController();

  Future<UserBodyRes?> getMyProfile() async {
    await initialize();
    var res = await profileService
        .getMyProfile(await sharedPreferences.getString('user') ?? "");

    if (res is UserBodyRes) {
      return res;
    } else {
      return null;
    }
  }

  Future<List<BadgeBodyRes>?> getBadges() async {
    var res = await profileService.getBadges();

    if (res is GetAllBadgeBodyRes) {
      return res.badges;
    } else {
      return null;
    }
  }
}
