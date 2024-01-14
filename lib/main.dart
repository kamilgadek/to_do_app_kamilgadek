import 'package:flutter/material.dart';
import 'package:to_do_app_koko/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      
      home: HomePage(),
    );
  }
}