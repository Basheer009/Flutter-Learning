import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BiCard extends StatefulWidget {
  const BiCard({Key? key}) : super(key: key);

  @override
  _BiCardState createState() => _BiCardState();
}

class _BiCardState extends State<BiCard> {
  static final lightColor = Colors.teal.shade100;
  static final lightColor200 = Colors.teal.shade200;
  static const myColor = Colors.teal;
  static const whiteColor = Colors.white;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      // width: double.infinity,
      padding: const EdgeInsets.only(bottom: 35.0),
      // transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('images/profile.webp'),
          ),
          const Text(
            "Basheer Adel",
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.normal,
              color: whiteColor,
              fontSize: 40.0,
            ),
          ),
          Text(
            "Android Developer",
            style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: lightColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.5),
          ),
          SizedBox(
            height: 20,
            width: 150,
            child: Divider(
              color: lightColor,
            ),
          ),
          Card(
            color: whiteColor,
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  size: 20,
                  color: myColor,
                ),
                title: Text(
                  "00967-71717211",
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: lightColor200,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () => _makePhoneCall('771717211'),
              ),
            ),
          ),
          Card(
            color: whiteColor,
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListTile(
                leading: const Icon(
                  Icons.mail,
                  size: 20,
                  color: myColor,
                ),
                title: Text(
                  "basheeradel009@gmail.com",
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: lightColor200,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
