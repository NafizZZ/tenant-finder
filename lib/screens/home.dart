import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';
import 'package:tenant_finder/screens/widgets/navigation_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  var email, password;
  HomeScreen({this.email, this.password});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
                ' email: ${widget.email} \n password: ${widget.password} \n This is home page. Tap the button to go back to login page'),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, loginRoute);
              },
              child: Text(
                'Sweet Home',
                style: TextStyle(color: Colors.amber[900], fontSize: 25),
              ),
            ),
          ),
        ],
      ),
      drawer: NavigationDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, createRentPost);          
        },
        child: const Icon(Icons.add_business),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
