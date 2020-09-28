import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // get data from route
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    // is day check
    String bgImage = data["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                if (result != null) {
                  setState(() {
                    data = {
                      'time': result["time"],
                      'location': result["location"],
                      'flag': result["flag"],
                      'isDayTime': result["isDayTime"],
                    };
                    print(data);
                  });
                }
              },
              icon: Icon(Icons.edit_location),
              label: Text("Edit Location"),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data["location"],
                  style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                ),
                SizedBox(width: 14),
                Image.asset('assets/${data["flag"]}', height: 40),
              ],
            ),
            SizedBox(height: 20),
            Text(
              data["time"],
              style: TextStyle(fontSize: 42),
            )
          ],
        ),
      ),
    );
  }
}
