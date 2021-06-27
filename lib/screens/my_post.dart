import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';
import 'package:tenant_finder/screens/navigation_drawer_widget.dart';

import 'package:tenant_finder/models/post.dart';
import 'package:tenant_finder/utils/database_helper.dart';
import 'package:tenant_finder/screens/rent_post.dart';

class MyPost extends StatefulWidget {
  // MyPost({Key? key}) : super(key: key);

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  List<Post> _posts = [];

  DatabaseHelper _dbHelper;

  @override
  void initState(){
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshPostList();
  }

  _refreshPostList() async{
    List<Post> x = await _dbHelper.fetchPosts();
    setState(() {
      _posts = x;
    });
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             _list(),
            ],
          ),
      ),
      drawer: NavigationDrawerWidget(),
    );
  }
  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle,
                        color: Colors.grey[500], size: 40),
                    title: Text(
                      _posts[index].address.toUpperCase(),
                      style: TextStyle(
                          color: Colors.grey[800], fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_posts[index].sizeOfPlace + '\n' + _posts[index].rentCommencementDate + '\n' + _posts[index].rentalPrice),
                  ),
                  Divider(
                    height: 5,
                  )
                ],
              );
            },
          ),
        ),
      );
}
