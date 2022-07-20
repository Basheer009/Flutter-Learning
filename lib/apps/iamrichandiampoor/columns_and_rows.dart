import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnsAndRows extends StatefulWidget {
  const ColumnsAndRows({Key? key}) : super(key: key);

  @override
  _ColumnsAndRowsState createState() => _ColumnsAndRowsState();
}

class _ColumnsAndRowsState extends State<ColumnsAndRows> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min, // to wrap
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start, // to align
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          // margin: const EdgeInsets.all(20.0), // All sides
          // margin: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0), // All sides top and bottom and left and right
          margin: const EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0), // All sides each one alone
          // margin: const EdgeInsets.only(left: 30.0), // only one side the others are 0
          padding: const EdgeInsets.all(10),
          color: Colors.grey,
          child: const Text("Lesson Two Margins and Padding"),
        ),
        const Text("containers inside a Column"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.green,
              child: const Text("Container 1"),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
              child: const Text("Container 2"),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.red,
              child: const Text("Container 3"),
            ),
          ],
        ),
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.green,
              child: const Text("Container 1"),
            ),
            const SizedBox(width: 20,),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
              child: const Text("Container 2"),
            ),
            const SizedBox(width: 20,),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.red,
              child: const Text("Container 3"),
            ),
          ],
        )
      ],
    );
  }
}
