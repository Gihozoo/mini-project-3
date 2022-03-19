// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:itike_v3/screens/airtel.dart';
import 'package:itike_v3/screens/homepage.dart';
import 'package:itike_v3/screens/payment.dart';

void main() {
  runApp(MaterialApp(title: " Payment", home: MtnPayment()));
}

class MtnPayment extends StatelessWidget {
  Color mycolor = Color(0xffFFFFFF);
  Color textcolor = Color(0xff0A2A49);
  Color buttoncolor = Color(0xffEF6E56);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mycolor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentMethod()));
          },
          icon: Icon(Icons.arrow_back, color: textcolor),
        ),
        title: Text(
          "Payment mode",
          style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: mycolor,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 40.0, left: 50.0),
                    child: Text("Payment Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textcolor,
                          fontSize: 20.0,
                        ))),
                Container(
                    padding: EdgeInsets.only(top: 40.0, left: 150.0),
                    child: Text("2560R",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttoncolor,
                          fontSize: 20.0,
                        )))
              ],
            ),
          ),
          Container(
            color: mycolor,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 80, left: 50.0),
                    child: MaterialButton(
                      minWidth: 180.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: textcolor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //color: mycolor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AirtelPayment()));
                      },
                      child: Text(
                        "Airtel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textcolor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
                    child: MaterialButton(
                      minWidth: 100.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: textcolor,
                      onPressed: () {
                        //code here
                      },
                      child: Text(
                        "MTN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: mycolor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 100, left: 20.0, right: 20.0),
                child: Text(
                  "Click on Pay for the order below to get a pop message from MTN. You will get a message when the process is done successfully. ",
                  style:
                      TextStyle(color: textcolor, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 200.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.lock),
                label: Text("Pay for this order"),
                style: ElevatedButton.styleFrom(
                    primary: buttoncolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: Size(420.0, 60)),
              )
            ],
          )
        ],
      ),
    );
  }
}
