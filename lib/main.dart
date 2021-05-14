import 'package:flutter/material.dart';
import 'homeFile.dart';
import 'indianFile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'H',
    routes: {
      'H':(context)=>homescreen(),
      'I':(context)=>indiannews(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

