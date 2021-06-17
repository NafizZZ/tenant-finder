import 'package:flutter/material.dart';

class RentPost extends StatefulWidget {
  // const RentPost({ Key? key }) : super(key: key);

  @override
  _RentPostState createState() => _RentPostState();
}

class _RentPostState extends State<RentPost> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Rent Post'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Address: ',
                        hintText: 'location of the place'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'size of place: ',
                        hintText: 'Square feet'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Rent Commencement Date: ',
                        hintText: '1/July/2021'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Rental Price: ',
                        hintText: '\$'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Booking Money: ',
                        hintText: 'advance payment/ security money'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  // color: Colors.blue[600],
                  width: double.infinity,
                  // height: 140,
                  child: TextFormField(
                    // textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white30,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.blue)),
                      labelText: 'Description: ',
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Text(
                        'Submit'),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
