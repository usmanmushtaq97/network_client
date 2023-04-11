//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:hive/hive.dart';

class NetworkInterFace {
  var box = Hive.box('token_box');
  void saveToken(var token) {
    box.put('Token_key', token);
  }

  String getToken() {
    return box.get('Token_key');
  }
}
