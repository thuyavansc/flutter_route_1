import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int count = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'srilanka.png'),
    WorldTime(url: 'America/Lima', location: 'Peru', flag: 'peru.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

    WorldTime(url: 'America/Guayaquil', location: 'Ecuador', flag: 'ecuador.png'),
    WorldTime(url: 'America/Bogota', location: 'Colombia', flag: 'colombia.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'Brazil', flag: 'brazil.png'),
    WorldTime(url: 'America/Caracas', location: 'Venezuela', flag: 'venezuela.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Malaysia', flag: 'malaysia.png'),
    WorldTime(url: 'Australia/Darwin', location: 'Australia (Northern Regions)', flag: 'australia.png'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
    'location': instance.location,
    'flag':  instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
    });
  }

  
  void getData() async{
    //Fetch Data From api
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(url);
    print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['userId']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('This is initState Function - Location - 1');
    getData();
    print('Hello World - 3');
  }

  @override
  Widget build(BuildContext context) {
    print('This is Build Function - Location - 2');
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        title: const Text('Location Screen'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('res/assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
