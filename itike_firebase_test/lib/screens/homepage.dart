// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itike_v3/screens/buyticket.dart';
import 'package:itike_v3/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Homescreen",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  Color mycolor = Color(0xffFFFFFF);
  Color textcolor = Color(0xff0A2A49);
  Color buttoncolor = Color(0xffEF6E56);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttoncolor,
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
        SizedBox(height: 25.0),
        Container(
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                    child: Text(
                      "Our destinations",
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 70.0),
                  Expanded(child: Image.asset("images/logo.png"))
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40.0),
        Container(
          height: MediaQuery.of(context).size.height - 185.0,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
          ),
          child: ListView(
            primary: false,
            padding: EdgeInsets.only(left: 25.0, right: 20.0),
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        _buildFoodItem(
                            'images/buses.jpeg', "Huye - Kigali", "2560F"),
                        _buildFoodItem(
                            'images/buses.jpeg', "Kigali - Rubavu", "2560F"),
                        _buildFoodItem(
                            'images/buses.jpeg', "Kigali - Gatuna", "2560F"),
                        _buildFoodItem(
                            'images/buses.jpeg', "Nyanza - Muhanga", "2560F"),
                        _buildFoodItem(
                            'images/buses.jpeg', "Kigali - Rusizi", "2560F"),
                      ],
                    ),
                  )),
              SizedBox(width: 40.0),
              Container(
                  height: 40.0,
                  width: double.infinity,
                  child: FlatButton(
                      color: buttoncolor,
                      textColor: mycolor,
                      onPressed: () {
                        logout(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Logout",
                          style: TextStyle(fontWeight: FontWeight.bold))))
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              //code here
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                color: textcolor,
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.add),
                    color: textcolor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BuyTicket()));
                    })
              ],
            )));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => loginForm())));
  }
}
