class UserSAP {
  String _username;
  String _password;

  UserSAP(this._username, this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}