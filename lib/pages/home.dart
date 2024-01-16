import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data = {};
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    
    // data = ModalRoute.of(context).settings.arguments;
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (data != null) {
      print('At Home:- $data');
      String location = data!['location'] as String;
      String flag = data!['flag'] as String;
      String time = data!['time'] as String;

      // Use location, flag, and time as needed...
    }

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget> [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context,'/location');
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text('Edit Location'),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data?['location'],
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  data?['time'],
                  style: const TextStyle(
                    fontSize: 80,
                  ),
                ),
              ],
                ),
          ),
    ),
    );
  }
}
