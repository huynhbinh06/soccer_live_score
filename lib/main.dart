import 'package:flutter/material.dart';
import 'package:soccer_live_score/api_manager.dart';
import 'package:soccer_live_score/pagerbody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAFAFA),
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SoccerAPI().getAllMatches(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return PageBody(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
