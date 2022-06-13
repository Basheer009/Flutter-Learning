import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  var leftDiceNumber = 1;

  var rightDiceNumber = 1;

  // int low = 1;
  // int high = 7;
  void _randomNumber() {
    Random random = Random();
    setState(() {
      // rightDiceNumber = random.nextInt(high-low) + low;
      rightDiceNumber = random.nextInt(6) + 1;
      leftDiceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onPressed: () {
                  _randomNumber();
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: () {
                  _randomNumber();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
