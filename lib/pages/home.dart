import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.edit_location),
          onPressed: (){
            Navigator.pushNamed(context, '/location');
          },
          label: const Text('Edit Location'),
        ),
      ),
    );
  }
}
