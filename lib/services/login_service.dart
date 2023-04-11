//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:network_client/api/_api.dart';
import 'package:network_client/api/models/LoginModel.dart';

class LoginService {
   ///  request type json
  ///  Method - post
  ///  Type-result [LoginModel]
  Future<dynamic> login(dynamic data) async {
    /// response from Network Api
    final response = NetWorkClient.instance
        .postApi(url: ApplicationEndPoint.login, data: data);
    /// response to object
    var result = LoginModel.fromJson(response);

    return result;
  }
}
