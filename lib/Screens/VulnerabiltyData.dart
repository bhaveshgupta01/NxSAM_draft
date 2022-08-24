import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nxsam_bg/Models/VulData.dart';
import 'package:nxsam_bg/Screens/Vulnerability.dart';

class VulnerData extends StatefulWidget {
  final VulData dataHere;

  const VulnerData({
    Key? key,
    required this.dataHere,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return DataShow(dataHere: dataHere);
  }
}

class DataShow extends State<VulnerData> {
  final VulData dataHere;

  DataShow({
    required this.dataHere,
  });

  static var _approval = ['Approved','Approved: Yes','Approved: No' , ];
  var dropDownApprovalItem= _approval[0];
  static var _validate = ['Validated','Validated: Yes','Validated: No' , ];
  var dropDownValidateItem= _validate[0];
  
  @override
  Widget build(BuildContext context){
  return
    // WillPopScope(
    // onWillPop: () {Navigator.pop(context);},
    //
    // child:
    Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: const Icon(Icons.arrow_back_ios_outlined), color: Colors.black,),
        title: const Text("Vulnerabilities", style: TextStyle(color: Colors.indigo, fontSize: 20)),
        backgroundColor: Colors.white,
        ),
      body: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: DropdownButton(
                          items: _approval.map((dropDownApprovalItem) {
                            return DropdownMenuItem<String> (
                              value: dropDownApprovalItem,
                              child: Text(dropDownApprovalItem),
                            );
                          }).toList(),

                          value: dropDownApprovalItem,

                          onChanged: (valueSelectedByUser)
                          {
                            setState(() {
                           // text here
                            });
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: DropdownButton(
                          items: _validate.map((dropDownValidateItem) {
                            return DropdownMenuItem<String> (
                              value: dropDownValidateItem,
                              child: Text(dropDownValidateItem),
                            );
                          }).toList(),

                          value: dropDownValidateItem,

                          onChanged: (valueSelectedByUser)
                          {
                            setState(() {
                              // text here
                            });
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(CheckPriority(dataHere.priority),
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Card(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Expanded(child: ListTile(
                        title: Text(dataHere.name, style: const TextStyle(color: Colors.indigo),),
                        subtitle: Text(dataHere.link),
                      )),

                      Expanded(child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,12,8,0),
                        child: ListTile(
                          title: const Text("Artifact"),
                          trailing: IconButton(
                            icon: const Icon(Icons.add_circle),
                            color: Colors.indigo,
                            onPressed: () {  },
                            padding: const EdgeInsetsDirectional.only(end: 5.0),
                          iconSize: 30,),
                        ),
                      )),
                      //LIST OF LIST OF ARTIFACTS
                      Expanded(child: ListView.builder(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dataHere.Artifacts.length,
                        itemBuilder: (BuildContext context, index)
                        {
                          return ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,5,10,5),
                                child: Card(
                                  margin: const EdgeInsets.fromLTRB(10,0,10,0),
                                  elevation: 5,
                                  child: ListView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text("CASE ${index+1})"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                        child: ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: dataHere.Artifacts[index].length,
                                            itemBuilder: (BuildContext context, indexa)
                                            {
                                              return ListTile(
                                                title: Text("step ${indexa+1})"),
                                                subtitle: Text(
                                                  dataHere.Artifacts[index][indexa],
                                                  style: const TextStyle(
                                                      fontSize: 20, color: Colors.indigo),
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {  },
                                                  icon: const Icon(Icons.more_vert),
                                                  color: Colors.indigo,),
                                              );
                                            }
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              )
                            ],
                          );
                        }
                      )),

                      Expanded(child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,12,8,2),
                        child: ListTile(
                            title:
                                const Text("Comments"),
                          trailing: IconButton(
                            icon: const Icon(Icons.add_circle),
                            color: Colors.indigo,
                            onPressed: () {  },
                            padding: const EdgeInsetsDirectional.only(end: 5.0),
                            iconSize: 30,),
                        ),
                      )),
                      //LIST OF comments
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.fromLTRB(10,0,10,0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                            itemCount: dataHere.Comment.length,
                            itemBuilder: (BuildContext context, index){
                              return ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(dataHere.Comment[index]),
                                    subtitle: Text('by ${dataHere.CommentAuthor[index]}'),
                                    trailing: const Text('3 hours ago'),
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
    // ),
  );
  }
  String CheckPriority(int value){
    String priority;
    switch(value)
    {
      case 1: priority="High";
      break;
      case 2: priority="Medium";
      break;
      case 3: priority="Low";
      break;
      default: priority="Low";
    }
    return priority;
  }
}
