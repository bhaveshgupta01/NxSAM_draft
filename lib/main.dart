import 'dart:core';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Screens/Client.dart';

void main()
{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Client()
    );
  }
}

