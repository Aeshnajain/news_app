import 'package:flutter/material.dart';
import 'homeFile.dart';
import 'indianFile.dart';
import 'usaFile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'H',
    routes: {
      'H':(context)=>homescreen(),
      'I':(context)=>indiannews(),
      'U':(context)=>usanews(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

