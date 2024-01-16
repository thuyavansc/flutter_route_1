import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        url: 'Asia/Colombo',
        // url: 'Europe/Berlin',
    );

    await worldTime.getTime();
    print(worldTime.time);
    // setState(() {
    //   time = worldTime.time;
    // });

    // Introduce a delay of 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag':  worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
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
    return  const Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 80.0,
        ),
      )
    );
  }
}
