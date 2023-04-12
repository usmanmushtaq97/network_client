//
// Created by Muhammad Usman on 12/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:flutter/material.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/provider/_provider.dart';

import '../../routes/routes.dart';

class ErrorDialog{
  showIFError({String title='Information', required String message})  {
    showDialog(
      context: locator<GlobalProvider>().globalContext!,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions:  [
              IconButton(onPressed: (){
                Routes.pop(locator<GlobalProvider>().globalContext!);
              }, icon: const Icon(Icons.info))
            ],
          ),
        );
      },
    );

  }

}