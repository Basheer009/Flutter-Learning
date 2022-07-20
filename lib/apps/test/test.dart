import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apps/test/screen0.dart';
import 'package:flutter_app/apps/test/screen1.dart';
import 'package:flutter_app/apps/test/screen2.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    // Navigator.pop(context);
    Scaffold.of(context).openDrawer();
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const Screen0(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Screen0(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
      },
    );
  }
}
