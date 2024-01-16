import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    //Network call  - API Get Request
    var url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Colombo');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from
    String dateTime = data['utc_datetime'];
    String offset = data['utc_offset'];
    print(offset);
    String offsetHour = data['utc_offset'].substring(1,3);
    print(offsetHour);
    String offsetMin = data['utc_offset'].substring(4,6);
    print(offsetMin);
    print('$offsetHour - $offsetMin');

    // print(dateTime);
    // print(dateTime + ' - ' + offset);
    // print('$dateTime - $offset');

    DateTime localDateTime = DateTime.parse(dateTime);
    localDateTime =  localDateTime.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
    print(localDateTime);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: SafeArea(
        child: Text(
            'Loading Screen',
        ),
      ),
    );
  }
}
