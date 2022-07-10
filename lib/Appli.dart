import 'package:flutter/material.dart';
import 'package:nxsam_bg/Audit.dart';

class Appli extends StatelessWidget {
  final String project;
  final List<String> appl;

  const Appli({
    Key? key,
    required this.project,
    required this.appl,
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
        body: HelloRectangle(appl: appl),
      ),
    );
  }
}

class HelloRectangle extends StatelessWidget {
  final List<String> appl;

  const HelloRectangle({
    Key? key,
    required this.appl,
  }) : super(key: key);

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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
