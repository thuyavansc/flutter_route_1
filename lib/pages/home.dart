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
    data = (data?.isNotEmpty ?? false) ? data! : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (data != null) {
      print('At Home:- $data');
      String location = data!['location'] as String;
      String flag = data!['flag'] as String;
      String time = data!['time'] as String;

      // Use location, flag, and time as needed...
    }

    String bgImage = data?['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    Color? bgColor = data?['isDayTime'] ? Colors.green[300] : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('res/assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget> [
                  TextButton.icon(
                    onPressed: () async {
                     dynamic result =  await Navigator.pushNamed(context,'/location');
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location': result['location'],
                         'isDayTime': result['isDayTime'],
                         'flag': result['flag'],
                       };
                     });
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data?['location'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    data?['time'],
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                  const SizedBox(height: 300,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/quote');
                        },
                        label: Text(
                          'Quote',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange[200],
                          ),
                        ),
                        icon: const Icon(
                          Icons.adb_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/quote');
                        },
                        label: Text(
                          'ID Card',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange[200],
                          ),
                        ),
                        icon: const Icon(
                          Icons.add_card_rounded,
                          color: Colors.lightBlueAccent,),
                      ),
                    ],
                  )
                ],
                  ),
            ),
          ),
    ),
    );
  }
}
