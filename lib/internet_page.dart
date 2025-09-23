import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter5/api_info.dart';

class InternetPage extends StatefulWidget {
  const InternetPage({super.key});

  @override
  State<InternetPage> createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  Future<ApiInfo> getData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos/3');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      log('internet page');
      return ApiInfo.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiInfo>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        if (snapshot.hasData) {
          final apiInfo = snapshot.data!;
          return Center(
            child: Wrap(
              spacing: 10,
              children: [
                const Icon(Icons.signal_wifi_connected_no_internet_4),
                Text(apiInfo.title),
              ],
            ),
          );
        }
        return const Center(child: Text("No data"));
      },
    );
  }
}
