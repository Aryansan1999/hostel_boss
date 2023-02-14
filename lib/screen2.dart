import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter Tutorial'),
          ),
        ),
        body: Center(
          child: Text(
            'Hello World! Welcome to TutorialKart for this awesome Flutter Tutorial on Text widget.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}