import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenant_finder/constants.dart';

import 'package:tenant_finder/models/post.dart';
import 'package:tenant_finder/screens/rent_post_list.dart';
import 'package:tenant_finder/utils/database_helper.dart';

class CreateRentPost extends StatefulWidget {
  // const CreateRentPost({ Key? key }) : super(key: key);

  @override
  _CreateRentPostState createState() => _CreateRentPostState();
}

class _CreateRentPostState extends State<CreateRentPost> {

  bool family = false;  
  bool bachelor = false;  

  File _image;

  Post _post = Post();
  final _formKey = GlobalKey<FormState>();
  DatabaseHelper _dbHelper;

  var postedByController = TextEditingController();
  var addressController = TextEditingController();
  var sizeController = TextEditingController();
  var bedroomNoController = TextEditingController();
  var rentDateController = TextEditingController();
  var rentPriceController = TextEditingController();
  var bookingMoneyController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
   
    postedByController.dispose();
    addressController.dispose();
    sizeController.dispose();
    bedroomNoController.dispose();
    rentDateController.dispose();
    rentPriceController.dispose();
    bookingMoneyController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
  }


// for picking image from camera
  _imgFromCamera() async {
  File image = await ImagePicker.pickImage(
    source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
}

// for picking image from gallery
_imgFromGallery() async {
  File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
}


void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
}

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
                  // color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    controller: postedByController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Posted By: ',
                        hintText: 'user name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name ';
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => setState(() => _post.address = val),
                  ),
                ),

                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    controller: addressController,
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
                    // onSaved: (val) => setState(() => _post.address = val),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child:Container(
                              margin:
                                  const EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                              // color: Colors.blue[600],
                              width: double.infinity,
                              height: 60,
                              child: TextFormField(
                                controller: sizeController,
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
                            // onSaved: (val) => setState(() => _post.sizeOfPlace = val),
                              ),
                            ),
                        ),
                        Expanded(
                         child:Container(
                          margin:
                              const EdgeInsets.only(right: 20, top: 10, left: 10, bottom: 10),
                          // color: Colors.blue[600],
                          width: double.infinity,
                          height: 60,
                          child: TextFormField(
                            controller: bedroomNoController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Bedrooms Number: ',
                                hintText: '3'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter numbers of bedroom';
                              } else {
                                return null;
                              }
                            },
                            // onSaved: (val) => setState(() => _post.sizeOfPlace = val),
                          ),
                        ),
                      ),
                  ],
                ),
                
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    controller: rentDateController,
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
                    // onSaved: (val) =>
                    //     setState(() => _post.rentCommencementDate = val),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    controller: rentPriceController,
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
                    // onSaved: (val) => setState(() => _post.rentalPrice = val),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // color: Colors.blue[600],
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    controller: bookingMoneyController,
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
                    // onSaved: (val) => setState(() => _post.bookingMoney = val),
                  ),
                ),

                Text('Rental Type',style: TextStyle(fontSize: 17.0, color: Colors.grey[700]), textAlign: TextAlign.left, ),  
                CheckboxListTile(  
                  title: const Text('Family'),  
                  controlAffinity: ListTileControlAffinity.trailing, 
                  secondary: const Icon(Icons.family_restroom_rounded),  
                  value: this.family,  
                  onChanged: (bool value) {  
                    setState(() {  
                      this.family = value;  
                    });  
                  },  
                ), 
                CheckboxListTile(  
                  title: const Text('Bachelor'),  
                  controlAffinity: ListTileControlAffinity.trailing,  
                  secondary: const Icon(Icons.accessibility_new),   
                  value: this.bachelor,  
                  onChanged: (bool value) {  
                    setState(() {  
                      this.bachelor = value;  
                    });  
                  },  
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
                    controller: descriptionController,
                    decoration: InputDecoration(
                      fillColor: Colors.white30,
                      filled: true,
                      border: OutlineInputBorder(),
                          // borderSide: new BorderSide(color: Colors.blue)),
                      labelText: 'Description: ',
                    ),
                    // onSaved: (val) => setState(() => _post.description = val),
                  ),
                ),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: ClipRRect(
                      // radius: 55,
                      // backgroundColor: Colors.blue,

                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                _image,
                                width: 150,
                                height: 130,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 130,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ), 
                    ),
                  ),
                ),

                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      storeData();
                    },
                    child: Text('Submit'),
                  ),
                ),
              ]),
            ),
          )),
    );
  }

  storeData() {
    if (_formKey.currentState.validate()) {
      // showDialog(
      //   context: context,
      //   builder: (context) {
          
      //     return AlertDialog(
      //       // Retrieve the text the user has entered by using the
      //       // TextEditingController.
      //       content: Text(postedByController.text + "\n" + addressController.text+ "\n" +  sizeController.text + "\n" +  bedroomNoController.text + "\n" + rentDateController.text + "\n" + rentPriceController.text + "\n" + bookingMoneyController.text + "\n" + descriptionController.text),
      //     );
      //   },
      // );
      _onSubmit();
    }
    // print("store data fucntion ");
  }
  _onSubmit() async {
    // var form = _formKey.currentState;
      // form.save();
     
      _post.posted_by = postedByController.text;
      _post.isActive = true;
      _post.address = addressController.text;
      _post.size_of_place = sizeController.text;
      _post.bedroom_no = bedroomNoController.text;
      _post.rent_commencement_date = rentDateController.text;
      _post.rental_price = rentPriceController.text;
      _post.booking_money = bookingMoneyController.text;
      _post.rental_type_family = family;
      _post.rental_type_bachelor = bachelor;
      _post.description = descriptionController.text;

      var response = await _dbHelper.insertPost(_post);
      print(response);

      // form.reset();
      Navigator.pushNamed(context, rentPostList);
  }
}
