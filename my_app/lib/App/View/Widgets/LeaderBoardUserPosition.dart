import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboarduserposition extends StatelessWidget {
  final userRank = 99999;
  final userName = "Your Name";
  final userMatchesPlayed = 9999999;


  @override
  Widget build(BuildContext context) {
    return
        Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  userRank.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                userName,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                userMatchesPlayed.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
  }
}