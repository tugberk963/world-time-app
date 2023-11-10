import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 
  String time = 'Can not fetch the time data.';

  void setWorldTime() async{
    WorldTime instance = WorldTime(location: 'Istanbul', flag: 'Turkey.png', url: 'Europe/Istanbul');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(time),
    );
  }
}
