import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pure Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const AdminConsole(title: 'Add an Admin'),
    );
  }
}

class AdminConsole extends StatelessWidget {
  const AdminConsole({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(leading: Text("Name $index"));
      })),
    );
  }
}
