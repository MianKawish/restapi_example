import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi_example/apiModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RestApi> postList = [];
  Future<List<RestApi>> ApiCall() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .timeout(Duration(seconds: 20));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (Map i in data) {
        postList.add(RestApi.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiCall(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.length.toInt());
                      return Card(
                        child: ListTile(
                          leading: Text(index.toString()),
                        ),
                      );
                    } else {
                      return const Text("Loading");
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
