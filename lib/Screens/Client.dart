import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Models/ClientData.dart';
import 'package:nxsam_bg/Screens/Appli.dart';

class Client extends StatelessWidget {
  const Client({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black54,),
        actions: [
          IconButton(onPressed: () {},
            icon: const Icon(Icons.notifications_none),
            color: Colors.black54,),
          IconButton(onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black54,),
        ],
        title: const Text(
            'All Project', style: TextStyle(color: Colors.indigo)),
        backgroundColor: Colors.white,
      ),
      body: HelloRectangle(),
    );
  }
}

class HelloRectangle extends StatelessWidget {
  final List<List<String>> application = [
    ['Adam Project', "Adam Project", 'Adam Project'],
    ['Adam Project', 'Adam Project', 'Adam Project', 'Adam Project'],
    ['Adam Project', 'Adam Project', 'Adam Project', 'Adam Project', 'Adam Project'],
  ];

  Future<List<ClientData>> usersFuture = fetchData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClientData>>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            // buildUsers(users);

            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Appli(project: users[index].client_name,
                                      id: users[index].client_id)
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(users[index].client_name,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.indigo),),
                                    Text('Applications ${application[index%3]
                                        .length}', textAlign: TextAlign.left,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: const [
                                          Text('3 Critical',),
                                          VerticalDivider(
                                              width: 5, thickness: 2,color: Colors.amber),
                                          Text('2 High',),
                                          VerticalDivider(),
                                          Text('2 Low'),
                                          VerticalDivider(),
                                          Text('2 Medium',)
                                        ]
                                    )
                                  ],
                                ),
                                IconButton(onPressed: () {},
                                  icon: Icon(Icons.pie_chart),
                                  color: Colors.red,),
                              ]
                          ),
                        ),
                      )
                  );
                }
            );
          }
          else return Text('No data found');
        }
    );
  }
}