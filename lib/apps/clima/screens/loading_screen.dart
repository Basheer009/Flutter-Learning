import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apps/clima/services/location.dart';
import 'package:flutter_app/apps/clima/utilities/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    setState(() {
      // getLocationAndShow();
      getLocationData();
    });
    super.initState();
  }

  final Location _locationService = Location();
  var location;

  Future<void> getLocationAndShow() async {
    if (await _locationService.getLocationPermission() == true) {
      if (kDebugMode) {
        print('getLocationPermission() == true');
      }
      _locationService.getCurrentLocation().then((position) {
        setState(() {
          location = 'Location is: ' +
              _locationService.latitude.toString() +
              "," +
              _locationService.longitude.toString();
          location = "Getting Weather for: " + location;
        });
        getLocationData();
      });
    } else {
      if (kDebugMode) {
        print('getLocationPermission() == false');
      }
    }
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    setState(() {
      location = "Getting Weather for: " + weatherData['name'];
    });
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // to wrap the widget in a column
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                //Get the current location
                try {
                  // double.parse('source');
                  setState(() {
                    getLocationAndShow();
                  });
                } catch (e) {
                  Utils.showSnackBar(context, e.toString());
                }
              },
              // child: Text('Get Location: $location'),
              child: Text(location ?? 'Getting Location.....',
                  style: const TextStyle(fontSize: 12)),
            ),
            const SpinKitWave(
              color: Colors.blue,
              size: 90.0,
            ),
          ],
        ),
      ),
    );
  }
}
