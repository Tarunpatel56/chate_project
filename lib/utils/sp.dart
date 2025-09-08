import 'dart:convert';

import 'package:facebook/models/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SPref {
   Future<void> saveUserData(UserModel data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userData = jsonEncode(data.toJson());
    prefs.setString("user", userData);
  }

  Future<UserModel> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.get("user");
    var userDecData = jsonDecode(userData.toString());
    return UserModel.fromJson(userDecData);
  }

}