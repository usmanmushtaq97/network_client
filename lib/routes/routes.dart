//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//

import 'package:flutter/material.dart';

class Routes {
  Routes._();

  /// The pop means the back of one Queue
  /// Example if got A to B Route then by calling this method will be on A
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  /// The push means the push the page like go to next page  A page to B page
  /// Example if got A to B Route then by calling this method will be on A
  static push(Object? argument,
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName, arguments: argument);
  }

  /// The push means the push the page like go to next page  A page to B page and remove all the routes from Queue
  /// Example if got A to B Route then by calling this method will be on A
  static pushRemovedUntil(Object? argument, RoutePredicate routePra,
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, routePra,
        arguments: argument);
  }
  /// It's working same like pop bas on cond
  /// Whether the navigator that most tightly encloses the given context can be popped.
  /// that  time we can use
 static canPop(BuildContext context){
    Navigator.canPop(context);
 }

}
