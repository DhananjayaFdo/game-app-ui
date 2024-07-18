import 'package:designs/screens/home/home.dart';
import 'package:designs/themes/theme_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeSettings.light,
      home: const HomeScreen(),
    );
  }
}
