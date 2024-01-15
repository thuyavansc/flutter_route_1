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
      backgroundColor: Colors.blue[200],
      body:SafeArea(
          child: Column(
            children: <Widget> [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context,'/location');
                },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location'),
              ),
            ],
    ),
    ),
    );
  }
}
