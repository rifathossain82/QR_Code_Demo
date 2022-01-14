import 'package:flutter/material.dart';
import 'package:qr_code_demo/pages/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey.shade900
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}