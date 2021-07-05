import 'package:flutter/material.dart';

class LoaderAnimation extends StatelessWidget {
  // const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ Center(child: CircularProgressIndicator())]);
  }
}
