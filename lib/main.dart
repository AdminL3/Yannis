import 'package:flutter/material.dart';
import 'package:yannis/main.dart';
import 'package:yannis/tile.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

