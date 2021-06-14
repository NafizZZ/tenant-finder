import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenant_finder/login_screen.dart';
import 'package:tenant_finder/screens/home_screen.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case '/home':
        var data = settings.arguments as Map;
        return CupertinoPageRoute(builder: (_) => HomeScreen(email: data['emailId'], password: data['password']));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
