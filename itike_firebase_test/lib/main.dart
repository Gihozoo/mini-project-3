// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itike_v3/screens/airtel.dart';
import 'package:itike_v3/screens/buyticket.dart';
import 'package:itike_v3/screens/homepage.dart';
import 'package:itike_v3/screens/login.dart';
import 'package:itike_v3/screens/mtn.dart';
import 'package:itike_v3/screens/payment.dart';
import 'package:itike_v3/screens/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCIh6BJl-qd5qqX5Kk0oTL6Ho_SJLwzVlY", // Your apiKey
      appId: "1:654317687755:android:40434525b80492d6155c4e", // Your appId
      messagingSenderId: "654317687755", // Your messagingSenderId
      projectId: "test-project-224ef", // Your projectId
    ),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "E-tike",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return loginForm();
  }
}
