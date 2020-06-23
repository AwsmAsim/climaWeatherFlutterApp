import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';


class NetworkHelper{

  NetworkHelper(this.url);
  final String url;
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();

    getData();
  }

  Future getData() async{

      http.Response response= await http.get('$url');
      if(response.statusCode==200)
      {
        String data = response.body;
        var decode = jsonDecode(data);
        return decode;
      }
      else{
            print(response.statusCode);
      }
 }
}