import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Models/VulData.dart';

class VulnerData extends StatelessWidget {
  final VulData DataHere;

  const VulnerData({
    Key? key,
    required this.DataHere,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: const Icon(Icons.arrow_back_ios_outlined), color: Colors.black,),
            title: Text("Vulnerabilities", style: const TextStyle(color: Colors.indigo, fontSize: 20)),
            backgroundColor: Colors.white,
          ),
          body: DataShow(),
        )
    );
  }
}

class DataShow {
}