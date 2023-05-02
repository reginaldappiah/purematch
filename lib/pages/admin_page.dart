import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  static List<String> dummyData = [
    "Joanne Robinson",
    "Joe Mike",
    "John Jameson",
    "John Johnson",
    "Joseph Smith",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add an Admin"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
            ),
            child: const CupertinoSearchTextField(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(leading: Text(dummyData[index]));
              },
              itemCount: dummyData.length,
            ),
          ),
        ],
      ),
    );
  }
}
