import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Models/VulData.dart';
import 'package:nxsam_bg/Screens/Vulnerability.dart';

class VulnerData extends StatefulWidget {
  final VulData DataHere;

  const VulnerData({
    Key? key,
    required this.DataHere,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return DataShow(DataHere: DataHere);
  }
}

class DataShow extends State<VulnerData> {
  final VulData DataHere;

  DataShow({
    required this.DataHere,
  });

  @override
  Widget build(BuildContext context){
  return Scaffold(

    appBar: AppBar(
      leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: const Icon(Icons.arrow_back_ios_outlined), color: Colors.black,),
      title: const Text("Vulnerabilities", style: TextStyle(color: Colors.indigo, fontSize: 20)),
      backgroundColor: Colors.white,
      ),
    body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Row(
                children: [

                ],
              ),
              Card(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Expanded(child: ListTile(
                      title: Text(DataHere.name),
                      subtitle: Text(DataHere.link),
                    )),

                    Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,12,8,2),
                      child: ListTile(
                        title: Row(
                          children: [
                            const Text("Artifact"),
                            IconButton(icon: Icon(Icons.add_circle), color: Colors.indigo, onPressed: () {  },),
                          ],
                        )
                      ),
                    )),
                    //LIST OF LIST OF ARTIFACTS
                    Expanded(child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: DataHere.Artifacts.length,
                      itemBuilder: (BuildContext context, index)
                      {
                        return ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  ListTile(
                                    title: Text("CASE ${index+1})"),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: DataHere.Artifacts[index].length,
                                      itemBuilder: (BuildContext context, indexa)
                                      {
                                        return ListTile(
                                          title: Text("step ${indexa+1})"),
                                          subtitle: Text(
                                            DataHere.Artifacts[index][indexa],
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.indigo),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {  },
                                            icon: Icon(Icons.more_vert),
                                            color: Colors.indigo,),
                                        );
                                      }
                                  )
                                ],
                              ),

                            )
                          ],
                        );
                      }
                    )),

                    Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,12,8,2),
                      child: ListTile(
                          title: Row(
                            children: [
                              const Text("Comments"),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                color: Colors.indigo,
                                onPressed: () {  },),
                            ],
                          )
                      ),
                    )),
                    //LIST OF comments
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: DataHere.Comment.length,
                          itemBuilder: (BuildContext context, index){
                            return ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                ListTile(
                                  title: Text(DataHere.Comment[index]),
                                  subtitle: Text('by ${DataHere.CommentAuthor[index]}'),
                                  trailing: Text('3 hours ago'),
                                )
                              ],
                            );
                          }
                        ),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
    )
  );
  }
}
