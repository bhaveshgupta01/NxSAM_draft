import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Screens/Audit.dart';
import 'package:http/http.dart' as http;
import 'package:nxsam_bg/Models/ProjectData.dart';
import 'package:nxsam_bg/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class Appli extends StatelessWidget {
  final String project;
  final int id;

  const Appli({
    Key? key,
    required this.project,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: project,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: const Icon(Icons.arrow_back_ios_outlined), color: Colors.black,),
          title: Text(project, style: const TextStyle(color: Colors.indigo, fontSize: 20)),
          backgroundColor: Colors.white,
        ),
        body: HelloRectangle(id: id),
      ),
    );
  }
}

class HelloRectangle extends StatelessWidget {
  final int id;
  // final List<String> appl;

  HelloRectangle({
    Key? key,
    required this.id,
  }) : super(key: key);

  Future<List<ProjectData>> projectsFuture = fetchData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: appl.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Audit(project: appl[index])
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(appl[index], style: const TextStyle(fontSize: 20,color: Colors.indigo),textAlign: TextAlign.left,),
                            const Text('4 Audits' ,textAlign: TextAlign.left,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:const [
                                  Text('3 Critical',),
                                  VerticalDivider(),
                                  Text('2 High',),
                                  VerticalDivider(),
                                  Text('2 Low'),
                                  VerticalDivider(),
                                  Text('2 Medium',)
                                ]
                            )
                          ],
                        ),
                        IconButton(onPressed:(){} , icon: const Icon(Icons.keyboard_arrow_right), color: Colors.redAccent,),
                      ]
                  ),
                ),
              )
          );
        }
    );
  }
}
