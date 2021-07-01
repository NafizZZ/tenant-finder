import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';
import 'package:tenant_finder/models/post.dart';
import 'package:tenant_finder/screens/widgets/navigation_drawer_widget.dart';
import 'package:tenant_finder/utils/database_helper.dart';

class RentPostList extends StatefulWidget {
  // RentPostList({Key? key}) : super(key: key);
  
  @override
  _RentPostListState createState() => _RentPostListState();
}

class _RentPostListState extends State<RentPostList> {

  var _posts = [];
  DatabaseHelper _dbHelper;
  @override
  void initState(){
    super.initState();
    setState((){
      _dbHelper = DatabaseHelper.instance;
    });
    fetchposts();
  }
  fetchposts() async {  
      var x = await _dbHelper.fetchPosts();
     
      // for(var post in _posts){
          //  print("postss : $_posts");
          //  var arr = [{'key' : 1}];
          //  print(arr[0]['key']);
          //  print(_posts[0]['bookingMoney']);
      // }
    setState(() {  
         _posts = x;
     });
  }
  

  // final List<String> entries = <String>['Gulshan', 'Banani', 'Dhanmondi'];
  // final List<int> colorCodes = <int>[600, 300, 100];
  // final List<int> price = <int>[600, 300, 100];
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
          itemCount: _posts.length,
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
                    Image.network(a[0], height: 250, width: double.infinity, fit: BoxFit.fill),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text('${ _posts[index][colAddress]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        
                        ),
                        // const SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('\$ ${ _posts[index]["rental_price"]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigoAccent),),
                        
                        ),
                        // const SizedBox(width: 8),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                      
                          child: Text('Booking money:  ${ _posts[index][colBookingMoney]}'),
                          
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
