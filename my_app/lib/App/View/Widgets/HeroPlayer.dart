import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#Player_Name",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "Total Played: 999 Matches",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                "Total Wins: 461 Matches",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                "Total Earning: 6317871TK",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Image.asset(
            'lib/App/Assets/grandmaster_badge.png', // Add your image in assets
            width: 100,
          ),
        ],
      ),
    );
  }
}
