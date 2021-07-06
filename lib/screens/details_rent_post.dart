import 'package:flutter/material.dart';
import 'package:tenant_finder/utils/database_helper.dart';

import '../constants.dart';
import '../loader_animation.dart';
import 'widgets/navigation_drawer_widget.dart';


class DetailsRentPost extends StatefulWidget {

  int post_id;
  DetailsRentPost({this.post_id});
  

  @override
  _DetailsRentPostState createState() => _DetailsRentPostState();
}

class _DetailsRentPostState extends State<DetailsRentPost> {
  bool isLoading = true;
  var _post = [];
  DatabaseHelper _dbHelper;
  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    fetchposts();
  }

  fetchposts() async {
    print('Id of the post is ${widget.post_id} !!');
    var fetchData = await _dbHelper.getSinglePostDetails(widget.post_id);
    // for(var post in _posts){
    // print("postss : $_posts");
    //  var arr = [{'key' : 1}];
    //  print(arr[0]['key']);
    //  print(_posts[0]['bookingMoney']);
    // }
    setState(() {
      _post = fetchData;
      print('fetched data at details_rent_post : $_post');
      isLoading = false;
      // print(isLoading);
    });
  }


   List images = [
    "https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg",
    "https://pbs.twimg.com/media/Dk3BtZRW0AAov5V.jpg",
    "https://i.pinimg.com/originals/9e/97/80/9e978052c3da56cec171517e65028965.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // print('this is id print: $id');
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

      body: isLoading == true
          ? LoaderAnimation()
          : Container(
        color: Colors.blueGrey[100],
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                    // height: 350,
                    // color: Colors.white,
                    child: Card(
                      // shape:Border.all(width: 5, ),
                      // elevation: 20,
                      // color: Colors.black,
                      child: Column(
                        children: <Widget>[
                          Image.network(images[0],
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.fill
                              ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text('Address: ${_post[0][colAddress]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('\$Rental Price: ${_post[0][colRentalPrice]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.indigoAccent),
                                ),
                              ),
                             
                            ]
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text('Size of place: ${_post[0][colSizeOfPlace]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Number of bedroom: ${_post[0][colBedroomNo]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      // color: Colors.indigoAccent
                                      ),
                                ),
                              ),
                             
                            ]
                          ),
                          Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Rent Commencement Date: ${_post[0][colRentCommencementDate]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      // color: Colors.indigoAccent
                                    ),
                              ),
                            ),
                          Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Booking Money: ${_post[0][colBookingMoney]} taka',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      // color: Colors.indigoAccent
                                    ),
                              ),
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Rental Type: ',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),), 
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: _post[0][colRentalTypeFamily] == 0
                                      ? Text('')
                                      : Text('Family',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,  vertical: 10),
                                child: _post[0][colRentalTypeBachelor] == 0
                                      ? Text('')
                                      : Text('Bachelor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      ),
                                ),
                              ),
                            ]
                          ),
                          Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: _post[0][colDescription] == ''
                                      ? Text('no descripiton!')
                                      : Text('Description: ${_post[0][colDescription]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Posted By: ${_post[0][colPostedBy]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                              ),
                            ),

                        ]
                      )
                    ),
      ),

      drawer: NavigationDrawerWidget(),
    );
  }
}
