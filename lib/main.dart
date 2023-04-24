import 'package:flutter/material.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/provider/auth_provider.dart';
import 'package:network_client/provider/global_provider.dart';
import 'package:network_client/routes/_routes.dart';
import 'package:provider/provider.dart';

import 'helper/global_services/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GlobalProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM http Network Client',
      navigatorKey: NavigationService.appNavigatorKey,
      onGenerateRoute:GenerateRouteSettings.generateRoute,
      initialRoute: RouteName.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
    );
  }
}
