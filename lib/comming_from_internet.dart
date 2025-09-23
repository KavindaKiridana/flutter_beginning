import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CommingFromInternet extends StatefulWidget {
  const CommingFromInternet({super.key});

  @override
  State<CommingFromInternet> createState() => _CommingFromInternetState();
}

class _CommingFromInternetState extends State<CommingFromInternet> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.https('v2.jokeapi.dev', '/joke/Any');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse['setup']);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception(
        'Request failed with status: ${response.statusCode}, body: ${response.body}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return Center(
            child: Wrap(
              spacing: 10,
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4),
                Text(snapshot.data['setup'].toString()),
              ],
            ),
          );
        } else {
          return Center(
            child: Wrap(
              spacing: 10,
              children: [Icon(Icons.error), Text(snapshot.error.toString())],
            ),
          );
        }
      },
    );
  }
}
