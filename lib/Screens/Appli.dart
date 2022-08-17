import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Screens/Audit.dart';
import 'package:nxsam_bg/Models/ProjectData.dart';

class Appli extends StatelessWidget {
  final String project;
  final int id;
  // final List<String> appl;


  const Appli({
    Key? key,
    required this.project,
    required this.id,
    // required this.appl,
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
    // required this.appl,
  }) : super(key: key);

  Future<List<ProjectData>> projectsFuture = fetchData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectData>>(
        future: projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            final appli = snapshot.data!;
            List appl = appli.where((o) => o.client_id == id).toList();

            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: appl.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Audit(project: appl[index].project_name)
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(appl[index].project_name,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.indigo),
                                      textAlign: TextAlign.left,),
                                    const Text('4 Audits',
                                      textAlign: TextAlign.left,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: const [
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
                                IconButton(onPressed: () {},
                                  icon: const Icon(Icons.keyboard_arrow_right),
                                  color: Colors.redAccent,),
                              ]
                          ),
                        ),
                      )
                  );
                }
            );
          }
          else
            return Text('No data found');
        }
    );
  }
}
