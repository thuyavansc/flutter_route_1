import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{
  String location; //location name for UI
  String time = ''; // time that in the location
  String flag; //URl to an assets flag icon
  String url = ''; //location url for api endpoint


  WorldTime({required this.location, required this.flag, required  this.url});

  Future<void> getTime() async{
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
    time = localDateTime.toString();
    //print(localDateTime);
  }

}

//Create Instance of class
//WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');