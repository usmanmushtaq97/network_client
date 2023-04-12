//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:get_it/get_it.dart';
import 'package:network_client/provider/_provider.dart';
import 'package:network_client/provider/auth_provider.dart';
import 'api/network/error_dialogs.dart';
import 'helper/exception_helper.dart';
GetIt locator = GetIt.instance;
void setUpLocator(){
  locator.registerSingleton<GlobalProvider>(GlobalProvider());
  locator.registerSingleton<ErrorDialog>(ErrorDialog());
  locator.registerSingleton<ExceptionHelper>(ExceptionHelper());
  locator.registerSingleton<AuthProvider>(AuthProvider());


}

