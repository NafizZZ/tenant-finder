import 'package:flutter/material.dart';

import 'widgets/navigation_drawer_widget.dart';

class DetailsRentPost extends StatelessWidget {
  // const DetailsRentPost({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black), // changing the drawer icon color
        title: Center(
            child: Text(
          "My Posts",
          style: TextStyle(fontSize: 20, color: Colors.indigoAccent),
        )),
        backgroundColor: Colors.white70,
      ),

      body: Container(
        color: Colors.blueGrey[100],
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                    height: 350,
                    // color: Colors.white,
                    child: Card(
                      // shape:Border.all(width: 5, ),
                      // elevation: 20,
                      // color: Colors.black,
                      
                    ),
      ),


      drawer: NavigationDrawerWidget(),
    );
  }
}
