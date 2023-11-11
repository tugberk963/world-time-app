import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  WorldTime({required this.location, required this.flag, required this.url});
  
  String location = ''; // Location name for the UI.
  String url = ''; // Url for api endpoint. Ex. 'Europe/Istanbul'.
  String flag = ''; // img path for flag.
  String time = ''; // Define time as an instance variable.
  bool isDayTime = true;
  
  // method for getting time from world time api.
  Future<void> getTime() async {
    try {
      DateTime now;

      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(
          response.body); // converting JSON data to MAP key:value pair.

      String datetime = data['datetime'];
      String utc = data['utc_offset'].substring(1, 3);

      now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc)));

      time = now.toString(); // Assign the value of now to the instance variable time.

      time = DateFormat.jm().format(now);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('Error: $e');
      time = 'Can not fetch the time data.';
    }
  }
}
