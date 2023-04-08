//
//  Created by Muhammad Usman on 06/04/2023.
//  usmanmushtaq848@gmail.com
//
enum Env { dev, uat, pro }
class NetworkConfig {
  static var appMode = Env.dev;
  final _dev = 'https://dev';
  final _uat = 'https://uat';
  final _pro = 'https://productions';
  // get the base url
  String getBaseUrl() {
    switch (appMode) {
      case Env.dev:
        return _dev;
      case Env.uat:
        return _uat;
      case Env.pro:
        return _pro;
    }
  }
}
