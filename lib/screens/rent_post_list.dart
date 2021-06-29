import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';
import 'package:tenant_finder/screens/widgets/navigation_drawer_widget.dart';

class RentPostList extends StatefulWidget {
  // RentPostList({Key? key}) : super(key: key);
  
  @override
  _RentPostListState createState() => _RentPostListState();
}

class _RentPostListState extends State<RentPostList> {
  final List<String> entries = <String>['Gulshan', 'Banani', 'Dhanmondi'];
  // final List<int> colorCodes = <int>[600, 300, 100];
  final List<int> price = <int>[600, 300, 100];
  List a = [
    "https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg",
    "https://pbs.twimg.com/media/Dk3BtZRW0AAov5V.jpg",
    "https://i.pinimg.com/originals/9e/97/80/9e978052c3da56cec171517e65028965.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black), // changing the drawer icon color
        title: Center(child: Text("My Posts", style: TextStyle(fontSize: 20, color: Colors.indigoAccent),)),
        backgroundColor: Colors.white70,
      ),
      body: Container(
        color: Colors.blueGrey[100],
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),


              height: 350,
              // color: Colors.white,
              child: Card(
                // shape:Border.all(width: 5, ),
                // elevation: 20,
                // color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Image.network(a[index], height: 250, width: double.infinity, fit: BoxFit.fill),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text('${entries[index]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        
                        ),
                        // const SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('\$ ${price[index]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigoAccent),),
                        
                        ),
                        // const SizedBox(width: 8),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: const Text('ABCD'),
                          
                        ),
                        // const SizedBox(width: 8),
                        TextButton.icon(
                          label: const Text('View more', style: TextStyle(fontSize: 15)),
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          onPressed: () {/* ... */}, 
                        ),
                        // const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      drawer: NavigationDrawerWidget(),
    );
  }
}