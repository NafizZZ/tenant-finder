import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';



class NavigationDrawerWidget extends StatelessWidget {
  // const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 80.0,
            child: ClipRRect(
              child: Image.asset('assets/images/profile_pic.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          
          ),

          //   DrawerHeader(
          //   decoration: BoxDecoration(
          //     // color: Colors.blue,
          //     borderRadius: BorderRadius.circular(50),
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/profile_pic.jpg'),
          //       fit: BoxFit.cover
          //     )
          //   ),
          //   child: Text("Header"),
          // ),

          Container(
            padding: EdgeInsets.all(15),
            child: Text( 'NAME', textAlign: TextAlign.center,),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.blue[700],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
             Navigator.pushNamed(context, rentPostList);
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add_outlined),
            title: Text('My Post'),
            onTap: () {
              Navigator.pushNamed(context, rentPostList);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
