//
// Created by Muhammad Usman on 06/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/material.dart';

class ExceptionHelper<T> {
  void _validateRequest(dynamic data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {



    });
  }

  /// the response
  processResponse(
    dynamic data,
    Function onComplete,
    Function onError, {
    bool skipErrorDialog = false,
  }) {
    /// 1 means success
    if (!skipErrorDialog) {
      if (data.code != 1) {
        _validateRequest(data);
        onComplete(data);
      } else {
        onError(data);
      }
    } else {
      onError(data);
    }
  }
}
