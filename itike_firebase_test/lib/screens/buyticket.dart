// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itike_v3/screens/homepage.dart';
import 'package:itike_v3/screens/payment.dart';

void main() {
  runApp(MaterialApp(
    title: "Book ticket",
    theme: ThemeData(primaryColor: Colors.pinkAccent),
    home: BuyTicket(),
  ));
}

class BuyTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuyTicketState();
  }
}

class BuyTicketState extends State<BuyTicket> {
  Color mycolor = Color(0xffFFFFFF);
  Color textcolor = Color(0xff0A2A49);
  Color buttoncolor = Color(0xffEF6E56);

  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: buttoncolor,
          title: Text("Ticket Information"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          )),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Container(
                padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{12,}$');
                    if (value!.isEmpty) {
                      return ("Please enter your name");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Name is too long(Min. 12 Character)");
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "NAME",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: buttoncolor))),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: timeinput,
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime.format(context));
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());

                        print(parsedTime);
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        print(formattedTime);

                        setState(() {
                          timeinput.text = formattedTime;
                        });
                      } else {
                        print("Select time!");
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "TIME",
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: buttoncolor))),
                  )),
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: dateinput,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "DATE",
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: buttoncolor))),
                  )),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("This place should be filled");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Too long(Min. 6 Character)");
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "From",
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttoncolor))),
                        )),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{8,}$');
                            if (value!.isEmpty) {
                              return ("Enter destination");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Destination is too long(Min. 8 Character)");
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "To",
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttoncolor))),
                        )),
                  )
                ],
              ),
              SizedBox(height: 100.0),
              Container(
                  height: 40.0,
                  width: double.infinity,
                  child: FlatButton(
                      color: buttoncolor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethod()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Book Ticket",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              SizedBox(height: 10.0),
              Container(
                height: 40.0,
                width: double.infinity,
                child: FlatButton(
                  color: Colors.transparent,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "Go Back",
                    style: TextStyle(
                        color: textcolor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }
}
