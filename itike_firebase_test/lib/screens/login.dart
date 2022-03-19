// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, unused_field, deprecated_member_use, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itike_v3/screens/signup.dart';

import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.pinkAccent),
    title: 'Itike',
    home: loginForm(),
  ));
}

class loginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginFormState();
  }
}

class _loginFormState extends State<loginForm> {
  Color mycolor = Color(0xffFFFFFF);
  Color textcolor = Color(0xff0A2A49);
  Color buttoncolor = Color(0xffEF6E56);

  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                          child: Text(
                            "ITIKE",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                          child: Text(
                            "says HI",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(270.0, 170.0, 0.0, 0.0),
                          child: Text(
                            ".",
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: buttoncolor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "please enter your Email";
                          //   }
                          //   if (!RegExp(
                          //           "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          //       .hasMatch(value)) {
                          //     return ("Please Enter a valid email");
                          //   }
                          //   return null;
                          // },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          decoration: InputDecoration(
                              labelText: "EMAIL",
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttoncolor))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: passwordController,
                          // validator: (value) {
                          //   RegExp regex = new RegExp(r'^.{6,}$');
                          //   if (value!.isEmpty) {
                          //     return ("Password is required for login");
                          //   }
                          //   if (!regex.hasMatch(value)) {
                          //     return ("Enter Valid Password(Min. 6 Character)");
                          //   }
                          // },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttoncolor))),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            onTap: () {
                              //code here
                            },
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: buttoncolor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 60.0),
                        Container(
                            height: 40.0,
                            width: double.infinity,
                            child: FlatButton(
                                color: buttoncolor,
                                textColor: Colors.white,
                                onPressed: () {
                                  //signIn(emailController.text,
                                  //passwordController.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("LOGIN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New on Itike?", style: TextStyle(color: textcolor)),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text("Register",
                            style: TextStyle(
                                color: buttoncolor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  //login function

  // void signIn(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login successful"),
  //               Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(builder: (context) => HomeScreen())),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e.message);
  //     });
  //   }
  // }
}
