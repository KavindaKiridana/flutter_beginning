import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class InternetPage extends StatefulWidget {
  const InternetPage({super.key});

  @override
  State<InternetPage> createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var url = Uri.https('v2.jokeapi.dev', '/joke/Any');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['delivery'];
      print('internet page');
      log('Number of books about http: $itemCount.');
      log(response.body);
    } else {
      log('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4),
          Text(' comming from the internet'),
        ],
      ),
    );
  }
}
