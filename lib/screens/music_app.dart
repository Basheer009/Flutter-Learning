import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicAppPage extends StatefulWidget {
  const MusicAppPage({Key? key}) : super(key: key);

  @override
  _MusicAppPageState createState() => _MusicAppPageState();
}

class _MusicAppPageState extends State<MusicAppPage> {
  final player = AudioCache();

  void _playSound(int soundNum) {
    player.play('note$soundNum.wav');
  }

  Expanded buildKey(int sound, MaterialColor color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          _playSound(sound);
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Expanded buildKey1(int sound, MaterialColor color) {
    return Expanded(
        child: Card(
      color: color,
      margin: EdgeInsets.zero,
      // elevation: 0.0,
      child: SizedBox(
        // height: 100.0,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {},
        ),
      ),
    ));
  }

  Expanded buildKey2(int sound, MaterialColor color) {
    return Expanded(
        child: Card(
      color: color,
      margin: EdgeInsets.zero,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          _playSound(sound);
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildKey2(1, Colors.red),
          buildKey2(2, Colors.orange),
          buildKey2(3, Colors.yellow),
          buildKey2(4, Colors.green),
          buildKey2(5, Colors.teal),
          buildKey2(6, Colors.blue),
          buildKey2(7, Colors.purple),
        ],
      ),
    );
  }
}
