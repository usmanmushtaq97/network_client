//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:flutter/material.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/provider/_provider.dart';

import '../../routes/routes.dart';

class AppLoader {
  AppLoader._privateConstructor();

  static final AppLoader _instance = AppLoader._privateConstructor();

  static AppLoader get instance => _instance;

  // context form app state such that the current context of screen
  final context = locator<GlobalProvider>().globalContext!;

  // hide the loading by calling this method
  void loaderHide() {
    Routes.pop(context);
  }

  // show the loader by calling this method
 Future<void>  loaderShow() async {
    print('show loader');
  }
}


