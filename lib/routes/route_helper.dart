//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/material.dart';
import 'package:network_client/routes/page_transitions.dart';
PageTransition materialRoutePageWidget({required Widget page, required name}){
  return PageTransition(child:page, type: PageTransitionType.bottomToTop, settings: RouteSettings(name:name));
}