import 'package:flutter/material.dart';
import 'package:map/models/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Map",
      home: LoginScreen(),
    );
  }
}
