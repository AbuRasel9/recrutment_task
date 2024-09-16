
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitment_tasks/utils/route/route_manager.dart';
import 'package:recruitment_tasks/utils/theme/app_theme_data.dart';

import 'core/view/auth/login_screen/login_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      // darkTheme: AppThemeData.darkThemeData,
      onGenerateRoute: onGenerateRoute,
      home: LoginScreen(),
    );
  }
}
