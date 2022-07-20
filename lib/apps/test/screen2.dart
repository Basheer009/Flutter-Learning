import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState() {
    print('Screen2 initState');
    super.initState();
  }

  @override
  void deactivate() {
    print('Screen2 deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('Screen2 build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          // color: Colors.blue,
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            // textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          child: Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
