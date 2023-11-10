import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location = ''; // Location name for the UI.
  String url = ''; // Url for api endpoint. Ex. 'Europe/Istanbul'.
  String flag = ''; // img path for flag.
  String time = ''; // Define time as an instance variable.


  WorldTime({required this.location, required this.flag, required this.url});
  // method for getting time from world time api.
  Future<void> getTime() async{
    DateTime now;

    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body); // converting JSON data to MAP key:value pair.
    
    String datetime = data['datetime'];
    String utc = data['utc_offset'].substring(1,3);

    now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(utc)));

    time = now.toString(); // Assign the value of now to the instance variable time.
  }
}