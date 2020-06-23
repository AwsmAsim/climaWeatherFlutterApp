import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey='d33378b0fcf5eadd81a73e1751584f8b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

   double lat,long;
  void initState(){
    super.initState();
    getLocationData();
    
  }

  void getLocationData() async{

    WeatherModel wheatherModel = WeatherModel();
    var weatherData = await wheatherModel.getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWheather: weatherData,);
    }));
  }


  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
