// Created by Muhammad Usman on 12/5/2022.
// SITC Ltd
// usmantech197@gmail.com
// © 2022-2022  - All Rights Reserved

class RouteName {
  /// created object
  static final RouteName _instance = RouteName._internal();

  /// initialize constructor
  RouteName._internal();

  /// created single tone class for getting  global and one object for instance using factory constructor
  factory RouteName() {
    return _instance;
  }

  static const String initialRoute = "/";

  /// this route that time need to show when the no route fond such as some
  /// one two search unknown URl that came to inside  with unknown route name
  static const String unknownRoute = "/UnknownRoute";
  static const String homePage = "/Home";
  static const String splashPage = "Splash";
}
