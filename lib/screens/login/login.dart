import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:s19miniapp/models/user.dart';

class Login {
  static String message = "";
  static final String _url =
      "http://s4training.citek.vn:8085/zservice_ht/login?sap-client=100";

  static Future<bool> callLoginApi(User user) async {
    var url = Uri.parse(_url);
    Map jsonData = {"username": user.username, "password": user.password};
    var body = json.encode(jsonData);
    var headers = {
      'Authorization': 'Basic Q1QuQUJBUDoxMjM0NTZ6WkAj',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    };
    var client = http.Client();
    try {
      var response = await client.post(url, headers: headers, body: body);
      print(response.body.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body.toString();
        Map<String, dynamic> result = jsonDecode(jsonString);
        var isSuccess = result["isSuccess"];
        log(isSuccess);
        if (isSuccess == '0') {
          message = result['message'];
          return true;
        } else {
          message = result['message'];
          return false;
        }
      } else {
        message = '${response.statusCode}-${response.body}';
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> login(User user) async {
    log("Username: ${user.username}");
    log("Password: ${user.password}");
    if (validateUser(user)) {
      if(await callLoginApi(user)) {
        return true;
      } else {
        return false;
      }
    } else {
      log(message);
      return false;
    }
  }

  static bool validateUser(User user) {
    if (user == null) {
      message = "Username and password cannot null";
      return false;
    } else if (user.password == null) {
      message = "Username and password cannot null";
      return false;
    } else if (user.username.trim() == "" || user.password.trim() == "") {
      message = "Username and password cannot null";
      return false;
    }
    return true;
  }
}
