class SigninBodyReq {
  String? password;
  String? email;

  SigninBodyReq({this.email, this.password});
  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "email": email,
    };
  }
}

class SignupBodyReq {
  String? password;
  String? email;
  String? firstname;
  String? lastname;

  SignupBodyReq();
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
    };
  }
}

class SigninSuccessRes {
  bool? success;
  String? message;
  String? user;
  SigninSuccessRes({this.success, this.message, this.user});
  factory SigninSuccessRes.fromJson(dynamic json) {
    return SigninSuccessRes(
      success: json['success'] as bool,
      message: json['message'] as String,
      user: json['user'] as String,
    );
  }
}

class SigninErrorRes {
  bool? success;
  String? message;

  SigninErrorRes({this.success, this.message});
  factory SigninErrorRes.fromJson(dynamic json) {
    return SigninErrorRes(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}
