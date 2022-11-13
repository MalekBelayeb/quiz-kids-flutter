import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/Screens/QuizHome.dart';
import 'package:quiz_flutter/Screens/QuizSignIn.dart';
import 'package:quiz_flutter/Screens/signup/QuizWelcome.dart';
import 'package:quiz_flutter/data/service/AuthService.dart';
import 'package:quiz_flutter/data/models/Auth.dart';
import 'package:quiz_flutter/utils/navigator_service.dart';

class AuthController {
  final AuthService authService = AuthService();
  static final instance = AuthController();

  SignupBodyReq signupBodyReq = SignupBodyReq();

  AuthController() {
    initialize();
  }
  Future<dynamic>? login({email, password}) async {
    var res = await authService
        .login(SigninBodyReq(email: email, password: password));

    if (res is SigninSuccessRes) {
      sharedPreferences.setString("id", res.user ?? "");
      push(QuizDashboard(), pageRouteAnimation: PageRouteAnimation.Slide);
    } else if (res is SigninErrorRes) {
      return SigninErrorRes();
    }
  }

  Future<dynamic>? signup() async {
    var res = await authService.signup(this.signupBodyReq);

    if (res is SigninSuccessRes) {
      push(QuizSignIn(), pageRouteAnimation: PageRouteAnimation.Slide);
    } else if (res is SigninErrorRes) {
      return SigninErrorRes();
    }
  }
}
