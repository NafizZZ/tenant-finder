import 'package:flutter/material.dart';

import 'widgets/navigation_drawer_widget.dart';


class DetailsRentPost extends StatefulWidget {

  int id;
  DetailsRentPost(this.id);

  @override
  _DetailsRentPostState createState() => _DetailsRentPostState();
}

class _DetailsRentPostState extends State<DetailsRentPost> {
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

      body: Container(
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
                                child: Text('Address: Lalmatia, Dhaka',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('\$Rental Price: 45000',
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
                                child: Text('Size of place: 1500',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Number of bedroom: 3',
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
                                child: Text('Rent Commencement Date: 31/July/2021',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      // color: Colors.indigoAccent
                                    ),
                              ),
                            ),
                          Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Booking Money: 5000 taka',
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
                                child: Text('Family',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              // const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,  vertical: 10),
                                child: Text('Bachelor',
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
                                child: Text('Description: this a very bad appertment but still you have to rent this!!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Text('Posted By: Mr. Walter',
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
