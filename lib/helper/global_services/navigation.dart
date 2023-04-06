//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:flutter/material.dart';

class NavigationService {
  // the singleton instance
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() {
    return _instance;
  }
  NavigationService._internal();
  // main navigation key
  static GlobalKey<NavigatorState> appNavigatorKey =
  GlobalKey<NavigatorState>();
}