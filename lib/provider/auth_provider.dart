//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/cupertino.dart';
import 'package:network_client/services/login_service.dart';

class AuthProvider with ChangeNotifier{
  late LoginService _loginService;
   AuthProvider(){
     _loginService = LoginService();
   }







}