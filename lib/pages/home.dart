import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;


    print(data['country']);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data['location'], style: TextStyle(fontSize: 24),),
              const SizedBox(height: 24,),
              Text(data['time'], style: TextStyle(fontSize: 64)),
              const SizedBox(height: 64,),
              ElevatedButton.icon(
                icon: const Icon(Icons.edit_location, color: Colors.black),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                label: const Text('Edit Location', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
