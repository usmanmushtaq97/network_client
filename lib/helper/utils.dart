//
// Created by Muhammad Usman on 06/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:logger/logger.dart';
import '../config/design_config.dart';

void appPrint(var value) {
  if (DesignConfig.printStatement) {
    var logger = Logger();
    logger.d(value);
  }
}
