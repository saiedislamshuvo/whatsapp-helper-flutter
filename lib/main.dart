import 'package:carrot/page/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard()
    );
  }
}
