import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_8/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Time is loading';

  void setUpWorldTime() async{
    WorldTime worldTime = WorldTime(
        location: 'Colombo',
        flag: 'colombo.jpg',
        url: 'Asia/Colombo'
    );

    await worldTime.getTime();
    print(worldTime.time);
    // setState(() {
    //   time = worldTime.time;
    // });
    // Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag':  worldTime.flag,
      'time': worldTime.time,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(time),
        ),
      ),
    );
  }
}
