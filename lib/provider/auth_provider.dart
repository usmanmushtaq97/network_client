//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/cupertino.dart';
import 'package:network_client/api/models/LoginModel.dart';
import 'package:network_client/api/network/network_base_response.dart';
import 'package:network_client/services/login_service.dart';

class AuthProvider with ChangeNotifier{
  late LoginService _loginService;
   AuthProvider(){
     _loginService = LoginService();
   }



  /// user login
  Future<dynamic> loginUserWithCredential({ var email,  var pass, }) async{
  final requestObject =
    {
      "email": "testuser12345@mailinator.com", //email
      "password": "12346789", // pass
      "user_channel_type": "tiktok" // chanel type
    };
      /// sync data  base loading
    var data  = _loginService.login(requestObject);
      /// sync data base complete
      /// sync data base  Error
    ///  sync data base provider and exception helper for dialog and miss dialoge
    // exceptionHelprt(

    // oncomplet
    // on Erorr
    //

  //  );


  }






}