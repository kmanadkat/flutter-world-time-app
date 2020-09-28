import 'package:flutter/material.dart';
import 'package:world_time/routes/ChooseLocation.dart';
import 'package:world_time/routes/Home.dart';
import 'package:world_time/routes/Loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
    initialRoute: '/',
  ));
}
