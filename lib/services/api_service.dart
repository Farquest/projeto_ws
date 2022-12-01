// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:projeto_ws/constants.dart';
import 'package:projeto_ws/model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
