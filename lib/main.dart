import 'package:flutter/material.dart';
import 'package:yimyimfood/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( theme: ThemeData(primarySwatch: Colors.green),
      title: 'YIMYIM Food',
      home: Home(),
    );
  }
}
