//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:flutter/material.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/provider/_provider.dart';

import '../../routes/routes.dart';

class AppLoader {
  static final AppLoader _instance = AppLoader._internal();

// factory constructor
  factory AppLoader() {
    return _instance;
  }

  // private constructor
  AppLoader._internal();

  // context form app state such that the current context of screen
  final context = locator<GlobalProvider>().globalContext!;

  // hide the loading by calling this method
  void loaderHide() {
    Routes.pop(context);
  }

  // show the loader by calling this method
 Future<void>  loaderShow() async {
    showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (bc, ania, anis) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
              semanticsLabel: 'Circular progress indicator',
            ),
          );
        });
  }
}


