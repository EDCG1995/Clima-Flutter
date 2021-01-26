import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Duration delay = Duration(seconds: 2);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  ///init state method for getting location and weather through the Location class in location.dart and NetworkHelper class in networking.dart
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    await Future.delayed(delay, () {});

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          size: 70,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
