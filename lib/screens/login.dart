import 'package:flutter/material.dart';
import 'package:tenant_finder/constants.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = 'n@augnitive.com';
    passwordController.text = '12345678';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email id ';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'This is not a valid email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password ';
                      } else if (value.length < 8) {
                        return 'need more then 8 character for password  ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      // if we use flutter version 2.12.0 or later version then we have to use _formKey.currentState! for null safty
                      if (_formKey.currentState.validate()) {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return AlertDialog(
                        //       // Retrieve the text the user has entered by using the
                        //       // TextEditingController.
                        //       content: Text(emailController.text +
                        //           "\n" +
                        //           passwordController.text),
                        //     );
                        //   },
                        // );
                        Navigator.pushNamed(context, rentPostList);
                        // Navigator.pushNamed(context, homeRoute, arguments: {'emailId': emailController.text, 'password': passwordController.text});
                      }

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),

                // Text('New User? Create Account')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
