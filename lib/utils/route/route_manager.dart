

import 'package:flutter/material.dart';

import 'package:recruitment_tasks/utils/route/routes_name.dart';

import '../../core/view/Home/home.dart';
import '../../core/view/auth/login_screen/login_screen.dart';
import '../../core/view/auth/signUp_screen/signUp_screen.dart';
// -----------------------------------
// Route Names Are Mapped Here
// -----------------------------------
Map<String, WidgetBuilder> routes({Object? arg}) => {
      RoutesName.home: (context) => const HomeScreen(),
      RoutesName.signup: (context) => const SignUpScreen(),
      RoutesName.login: (context) => const LoginScreen(),
      // RoutesName.main: (context) => const MainView(),
    };

// -----------------------------------------
// Generate Route With Name And View Mapped
// -----------------------------------------
Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  final Function? builder =
      routes(arg: routeSettings.arguments)[routeSettings.name];
  if (builder != null) {
    final Route route = MaterialPageRoute(
        settings: routeSettings, builder: (context) => builder(context));
    return route;
  } else {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text('Page not found for ${routeSettings.name}'),
        ),
      ),
    );
  }
}
