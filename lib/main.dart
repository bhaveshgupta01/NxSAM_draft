import 'dart:core';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Appli.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:(){} , icon: const Icon(Icons.menu), color: Colors.black54,),
          actions: [
            IconButton(onPressed:(){} , icon: const Icon(Icons.notifications_none), color: Colors.black54,),
            IconButton(onPressed:(){} , icon: const Icon(Icons.search), color: Colors.black54,),
          ],
          title: const Text('All Project', style: TextStyle(color: Colors.indigo)),
          backgroundColor: Colors.white,
          ),
          body: HelloRectangle(),
      ),
    ),
  );
}


class HelloRectangle extends StatelessWidget {
  final List<String> Name = <String>['Esec Project', 'Rajpush Project', 'FingerTips Project'];
  final List<List<String>> application =[
    ['Adam Project', "Adam Project",'Adam Project'],
    ['Adam Project', 'Adam Project','Adam Project','Adam Project'],
    ['Adam Project', 'Adam Project','Adam Project','Adam Project','Adam Project'],
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: Name.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Appli(project: Name[index],appl: application[index])
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(Name[index], style: const TextStyle(fontSize: 20,color: Colors.indigo),textAlign: TextAlign.left,),
                          Text('Applications ${application[index].length}',textAlign: TextAlign.left,),
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
                      IconButton(onPressed:(){} , icon: Icon(Icons.pie_chart), color: Colors.red,),
                    ]
                  ),
                ),
              )
            );
          }
      );
  }
}
