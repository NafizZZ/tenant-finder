import 'package:flutter/material.dart';
import 'package:tenant_finder/screens/login_screen.dart';
import 'package:tenant_finder/route_generator.dart';
// import 'package:tenant_finder/utils/database_helper.dart';

void main() {
  // DatabaseHelper._initDatabase();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TENANT FINDER',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
      home: LoginScreen(),
    );
  }
}

