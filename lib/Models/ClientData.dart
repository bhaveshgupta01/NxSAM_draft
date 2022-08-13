import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<ClientData>> fetchData() async {
  final response = await http
      .get(Uri.parse('https://jsonkeeper.com/b/ZHW3'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    //return ClientData.fromJson(jsonDecode(response.body));

    Map<String, dynamic> resp = json.decode(response.body);
    Map<String, dynamic> dataJson = resp["data"];
    Map<String, dynamic> clientsJson = dataJson["clients"];
    List<dynamic> web = clientsJson["web"];
    return web.map<ClientData>(ClientData.fromJson).toList();

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ClientData {
  final int client_id;
  final String client_name;

  const ClientData({
    required this.client_id,
    required this.client_name,
  });

  static ClientData fromJson(json)=> ClientData(
      client_id: json['client_id'],
      client_name: json['client_name']);

  // factory ClientData.fromJson(Map<String, dynamic> json) {
  //   Map<String, dynamic> resp = json.decode(response.body);
  //   Map<String, dynamic> dataJson = resp["data"];
  //   Map<String, dynamic> clientsJson = dataJson["clients"];
  //   List<Map<String, dynamic>> web = clientsJson["web"];
  //   for (Map<String, dynamic> json in web){
  //     clientId = json['client_id'];
  //     name = json['client_id'];
  //   }

    // return ClientData(
    //   clientId: json['data.clients.web.client_id'],
    //   name: json['data.clients.web.client_name'],
    // );
}


// Future<List<ClientData>> getUsers() async{
//   const url = 'https://jsonkeeper.com/b/ZHW3';
//   final response = await http.get(Uri.parse(url));
//
//   final body = json.decode(response.body);
//
//
//   return body.map<ClientData>(ClientData.fromJson).toList();
// }
