import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'tr.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacementNamed(context, '/home',
                            arguments: {
                              'location': locations[index].location,
                              'flag': locations[index].flag,
                              'time': locations[index].time,
                              'isDayTime': locations[index].isDayTime
                            });
                      });
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/${locations[index].flag}',
                      ),
                    ),
                    title: Text(locations[index].location),
                  ),
                ),
              );
            }));
  }
}
