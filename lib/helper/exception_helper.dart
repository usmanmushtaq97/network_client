//
// Created by Muhammad Usman on 06/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/material.dart';
import 'package:network_client/api/network/error_dialogs.dart';
import 'package:network_client/get_it.dart';

class ExceptionHelper<T> {
  void _validateRequest(dynamic data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<ErrorDialog>().showIFError(message: data.message);
    });
  }

  /// the response
  processResponse(
    dynamic data,
      { required Function(dynamic data) onComplete,
    required Function(dynamic data) onError,
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
