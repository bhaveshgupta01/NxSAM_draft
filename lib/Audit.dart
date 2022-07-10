import 'package:flutter/material.dart';

class Audit extends StatelessWidget {
  final String project;

  const Audit({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: project,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:(){ Navigator.pop(context);} , icon: const Icon(Icons.arrow_back_ios_outlined), color: Colors.black,),
          title: Text(project, style: const TextStyle(color: Colors.indigo, fontSize: 20)),
          backgroundColor: Colors.white,
        ),
        body:
        HelloRectangle(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.indigo,
          onPressed: () {},),
      ),
    );
  }
}

class HelloRectangle extends StatelessWidget {
  final List<String> AuditName = <String>['Internal Audit', 'External Audit'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: AuditName.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(AuditName[index], style: const TextStyle(fontSize: 20, color: Colors.indigo),textAlign: TextAlign.left,),
                        const Text('In Progress' ,textAlign: TextAlign.left,),
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
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              IconButton(onPressed: (){}, icon: const Icon(Icons.lock_clock)),
                              const Text('10 July 22',)
                            ]
                        )
                      ],
                    ),
                    PopupMenuButton(

                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("Change Status"),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text("Assign Auditor"),
                            value: 2,
                          ),
                          const PopupMenuItem(
                            child: Text("Generate Report Pdf"),
                            value: 3,
                          ),
                          const PopupMenuItem(
                            child: Text("Generate Report"),
                            value: 4,
                          )
                        ])
                  ]
              ),
            ),
            //)
          );
        }
    );
  }
}
