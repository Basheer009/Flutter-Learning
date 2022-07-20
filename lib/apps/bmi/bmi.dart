import 'package:flutter/material.dart';
import 'package:flutter_app/apps/bmi/screens/input_page.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}

// return MaterialApp(
// debugShowCheckedModeBanner: false,
// theme: ThemeData.dark().copyWith(
// primaryColor: const Color(0xFF0A0E21),
// scaffoldBackgroundColor: const Color(0xFF0A0E21),
// ),
// home: const InputPage(),
// );