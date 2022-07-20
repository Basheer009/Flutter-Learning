import 'package:flutter/material.dart';
import 'package:flutter_app/apps/bitcoin/price_screen.dart';

class BitcoinTickerPage extends StatefulWidget {
  const BitcoinTickerPage({Key? key}) : super(key: key);

  @override
  _BitcoinTickerPageState createState() => _BitcoinTickerPageState();
}

class _BitcoinTickerPageState extends State<BitcoinTickerPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
