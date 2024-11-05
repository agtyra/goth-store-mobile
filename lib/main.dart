import 'package:flutter/material.dart';
import 'package:goth_store/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goth Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey, 
        ).copyWith(
          secondary: Colors.black,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
