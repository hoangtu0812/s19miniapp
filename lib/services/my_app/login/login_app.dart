import 'package:mysql_client/mysql_client.dart';
import 'package:s19miniapp/database/connect_database.dart';
import 'package:s19miniapp/models/app_models/user.dart';
class LoginApp {
  static String message = '';
  static bool validate(User user){
    if(user.username.trim() == '' || user.password.trim() == '') {
      message = 'Username and password can not empty';
      return false;
    }
    return true;
  }
  static bool authenticate(User user) {
    if(validate(user)) {
      Future<MySQLConnection> connection = Database().openConnection();
      return true;
    } else {
      return false;
    }
  }

}