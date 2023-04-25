//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/cupertino.dart';
import 'package:network_client/api/models/LoginModel.dart';
import 'package:network_client/api/network/network_base_response.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/helper/exception_helper.dart';
import 'package:network_client/services/login_service.dart';

class AuthProvider with ChangeNotifier {
  late LoginService _loginService;
  AuthProvider() {
    _loginService = LoginService();
  }

  NetWorkApiResponse<LoginModel>? _login;

  NetWorkApiResponse<LoginModel>? get login => _login;

  /// user login
  Future<dynamic> loginUserWithCredential({
    var email,
    var pass,
  }) async {
    final requestObject = {
      "name": "morpheus",
      "job": "leader"
    };

    /// sync data  base loading
    _login = NetWorkApiResponse.loading('loading');
    var data = _loginService.login(requestObject);
    locator<ExceptionHelper>().processResponse(data, onComplete: (data) {
      _login = NetWorkApiResponse.onCompleted(data);
      notifyListeners();
    }, onError: (data) {
      _login = NetWorkApiResponse.onError(data);
      notifyListeners();
    });
  }
}
