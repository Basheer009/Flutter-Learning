import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/primary_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String route = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {

  late AnimationController _controller;
  late AnimationController _controllerBackgroundColor;
  late Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // upperBound: 100.0,
    );

    _controllerBackgroundColor = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    _controller.forward();
    _controllerBackgroundColor.forward();
    // _controller.reverse(from: 1.0);
    _controller.addListener(() {
      setState(() {});
      Get.log('${_controller.value}');
      Get.log('${_animation.value}');
    });
    _controllerBackgroundColor.addListener(() {
      setState(() {});
      // Get.log('${_controller.value}');
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(_controllerBackgroundColor.value),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                      child: Image.asset('images/logo.png'),
                      // height: 60.0,
                      // height: _controller.value,
                      height: _animation.value * 100,
                  ),
                ),
                Text(
                  // 'Flash Chat',
                  '${_controller.value.toInt() * 100 }%',
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            PrimaryButton(
              buttonText: 'Log in',
              color: Colors.lightBlueAccent,
              action: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
            ),
            PrimaryButton(
              buttonText: 'Register',
              color: Colors.blueAccent,
              action: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}