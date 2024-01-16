import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for UI
  String time = ''; // time that in the location
  String flag; //URl to an assets flag icon
  String url = ''; //location url for api endpoint
  bool isDayTime = false;


  WorldTime({required this.location, required this.flag, required  this.url});

  Future<void> getTime() async{

    try{
      //Network call  - API Get Request
      var _url = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(_url);
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

      DateTime localDateTime = DateTime.parse(dateTime);
      localDateTime =  localDateTime.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      // time = localDateTime.toString();
      // print('Line 1 - $time');

      isDayTime = (localDateTime.hour > 6 && localDateTime.hour < 18) ? true : false;

      time = DateFormat.jm().format(localDateTime);
      print('Line 2 - $time');

    }
    catch(e){
      print('Error catch : $e' );
      time = 'Could not get data from api';
    }

  }

}

//Create Instance of class
//WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');