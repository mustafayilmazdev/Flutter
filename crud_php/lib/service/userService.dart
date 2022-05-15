import 'dart:convert';

import 'package:crud_php/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  var ADD_URL = Uri.parse("http://172.24.144.1:8080/crud_php/add.php");
  var VIEW_URL = Uri.parse("http://172.24.144.1:8080/crud_php/view.php");
  var UPDATE_URL = Uri.parse("http://172.24.144.1:8080/crud_php/update.php");
  var DELETE_URL = Uri.parse("http://172.24.144.1:8080/crud_php/delete.php");
  Future<String> addUser(UserModel userModel) async {
    final response = await http.post(ADD_URL, body: userModel.toJsonAdd());

    if (response.statusCode == 200) {
      print("Add Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> updateUser(UserModel userModel) async {
    final response =
        await http.post(UPDATE_URL, body: userModel.toJsonUpdate());

    if (response.statusCode == 200) {
      print("Update Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteUser(UserModel userModel) async {
    final response =
        await http.post(DELETE_URL, body: userModel.toJsonUpdate());

    if (response.statusCode == 200) {
      print("Delete Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  List<UserModel> userFromJson(String jsonString) {
    final data = jsonDecode(jsonString);
    return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  }

  Future<List<UserModel>> getUser() async {
    final response = await http.get(VIEW_URL);
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      // ignore: deprecated_member_use
      return List<UserModel>();
    }
  }
}
