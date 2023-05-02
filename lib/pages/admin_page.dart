import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add an Admin"),
      ),
      body: Center(child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(leading: Text("Name $index"));
      })),
    );
  }
}
