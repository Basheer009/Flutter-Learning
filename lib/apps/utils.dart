import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';

// void settInterspt(){
//   @override
//   void initState() {
//     super.initState();
//     BackButtonInterceptor.add(myInterceptor);
//   }
//
//   @override
//   void dispose() {
//     BackButtonInterceptor.remove(myInterceptor);
//     super.dispose();
//   }
//
//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     print("BACK BUTTON!"); // Do some stuff.
//     // Navigator.pop(context);
//     // Scaffold.of(context).openDrawer();
//     return true;
//   }
// }