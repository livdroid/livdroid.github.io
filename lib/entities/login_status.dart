class LoginStatus {

  String errorMessage = "";
  Status errorType = null;

  LoginStatus({this.errorType, this.errorMessage});
}

enum Status {
  login_success,
  name_not_found,
  wrong_password,
  banned,
  other
}