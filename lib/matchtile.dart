import 'package:flutter/material.dart';
import 'soccermodel.dart';

Widget matchTile(SoccerMatch match) {

  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;

  if(homeGoal == null) homeGoal = 0;
  if(awayGoal == null) awayGoal = 0;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        Image.network(
          match.home.logo,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            "${homeGoal} - ${awayGoal}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        Image.network(
          match.away.logo,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.away.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
