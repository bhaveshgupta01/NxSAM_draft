import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<ProjectData>> fetchData() async {
  final response = await http
      .get(Uri.parse('https://jsonkeeper.com/b/ZHW3'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    //return ClientData.fromJson(jsonDecode(response.body));

    Map<String, dynamic> resp = json.decode(response.body);
    Map<String, dynamic> dataJson = resp["data"];
    Map<String, dynamic> clientsJson = dataJson["projects"];
    List<dynamic> web = clientsJson["web"];
    return web.map<ProjectData>(ProjectData.fromJson).toList();

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class ProjectData {
  final int project_id;
  final String project_name;
  final int client_id;

  const ProjectData({
    required this.project_id,
    required this.project_name,
  required this.client_id,
  });

  static ProjectData fromJson(json)=> ProjectData(
    project_id: json['project_id'],
    project_name: json['project_name'],
    client_id: json['client_id']
  );
}
