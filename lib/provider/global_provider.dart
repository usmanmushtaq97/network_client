//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/cupertino.dart';
import '../helper/global_services/navigation.dart';
// this global provider which include all global things
class GlobalProvider with ChangeNotifier{
  // globalContext
  // use this Context as global
  final  globalContext = NavigationService.appNavigatorKey.currentContext;



}