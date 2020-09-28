import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "India", flag: "india.png", url: "Asia/Kolkata"),
    WorldTime(location: "Australia", flag: "australia.png", url: "Australia/Eucla"),
    WorldTime(location: "Canada", flag: "canada.png", url: "America/Edmonton"),
    WorldTime(location: "Germany", flag: "germany.png", url: "Europe/Berlin"),
    WorldTime(location: "Singapore", flag: "singapore.png", url: "Asia/Singapore"),
    WorldTime(location: "U S A", flag: "usa.png", url: "America/New_York"),
    WorldTime(location: "United Kingdom", flag: "uk.png", url: "Europe/London"),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A3D50),
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.fromLTRB(14, 15, 14, 0),
            child: ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 8),
                child: Image.asset(
                  'assets/${locations[index].flag}',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(locations[index].location),
              subtitle: Text(locations[index].url),
              onTap: () {
                updateTime(index);
              },
            ),
          );
        },
      ),
    );
  }
}
