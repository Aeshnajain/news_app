import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class indiannews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Color(0xFFFBF8BE),
        ),
        title: Text(
          "INDIAN_NEWS",
          style: TextStyle(color: Color(0xFFFBF8BE)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF234E70),
      ),
      body: myApp(),
      backgroundColor: Color(0xFFFBF8BE),
    );
  }
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  String content;
  int count = 0;
  List<Widget> mylist = [];

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  void getData() async {
    var myresponse = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=f563aa5da89844eca63093d836e70b22'));
    if (myresponse.statusCode == 200) {
      String data = myresponse.body;
      //print(data);
      String headline = jsonDecode(data)['articles'][count]['title'];
      String url = jsonDecode(data)['articles'][count]['urlToImage'];
      String nurl = jsonDecode(data)['articles'][count]['url'];
      if (headline != null && url != null ) {
        mylist.add(Card(
          color: Color(0xFF234E70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headline,
              style: TextStyle(
                   color: Color(0xFFFBF8BE),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ));
        mylist.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(url),
        ));
        mylist.add(ElevatedButton(
            style: ElevatedButton.styleFrom(primary:Color(0xFF234E70),),
            onPressed: () async {
              await _launchURL(nurl);
            },
            child: Text('READ_MORE',style: TextStyle(color: Color(0xFFFBF8BE),),))
        );
      }
      count++;
    } else {
      print(myresponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: mylist,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary:Color(0xFF234E70),),
              onPressed: () async {
                await getData();
                setState(() {});
              },
              child: Row(
                children: [
                  Hero(
                      tag: 'logo',
                      child: Image.network(
                        'https://wallpaperaccess.com/full/4455652.jpg',
                        width: 50,
                        height: 50,
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "GET_UPDATE",
                    style: TextStyle(fontSize: 20,color: Color(0xFFFBF8BE), ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
