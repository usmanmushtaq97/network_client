//
// Created by Muhammad Usman on 04/04/2023.
//  usmanmushtaq848@gmail.com
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:network_client/routes/route_helper.dart';
import 'package:network_client/routes/route_name.dart';
import 'package:network_client/views/pages/homePage.dart';


class GenerateRouteSettings {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routeName = settings.name;
    var uri = Uri.parse(routeName!);
    if (kDebugMode) {
      print('Route ### $uri');
    }

    /// routes name
    switch (routeName) {
      case RouteName.homePage:
        return materialRoutePageWidget(
            page: const HomePage(), name: RouteName.homePage);
      default:
        return materialRoutePageWidget(
            page: const HomePage(), name: RouteName.unknownRoute);
    }
  }
}
