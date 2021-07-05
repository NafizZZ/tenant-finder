import 'package:flutter/material.dart';
import 'package:tenant_finder/screens/login.dart';
import 'package:tenant_finder/route_generator.dart';

void main() {
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

