import 'dart:math';

import 'package:flutter/material.dart';

class AskMeAnything extends StatefulWidget {
  const AskMeAnything({Key? key}) : super(key: key);

  @override
  _AskMeAnythingState createState() => _AskMeAnythingState();
}

class _AskMeAnythingState extends State<AskMeAnything> {
  int imageNumber = 2;

  void _changeImageNumber() {
    Random randomNumber = Random();
    setState(() {
      imageNumber = randomNumber.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Banner(
            message: "قوة القوة",
            location: BannerLocation.bottomStart,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  _changeImageNumber();
                },
                child: Image.asset('images/ball$imageNumber.png')),
          )
        ],
      ),
    );
  }
}
