import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenant_finder/screens/details_rent_post.dart';
import 'package:tenant_finder/screens/login.dart';
import 'package:tenant_finder/screens/home.dart';
import 'package:tenant_finder/screens/rent_post_list.dart';
import 'package:tenant_finder/screens/create_rent_post.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case '/home':
        var data = settings.arguments as Map;
        return CupertinoPageRoute(builder: (_) => HomeScreen(email: data['emailId'], password: data['password']));
      case '/createRentPost':
        return CupertinoPageRoute(builder: (_) => CreateRentPost());
      case '/rentPostList':
        return CupertinoPageRoute(builder: (_) => RentPostList());
      case '/detailsRentPost':
        return CupertinoPageRoute(builder: (_) => DetailsRentPost());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
