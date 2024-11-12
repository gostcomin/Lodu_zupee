import 'package:flutter/material.dart';

class Leaderboardlist extends StatelessWidget {
// Demo data for demonstration
  final leaderboardData = [
    {"rank": 1, "name": "Player Name", "matchesPlayed": 9999999},
    {"rank": 2, "name": "Player Name", "matchesPlayed": 9999999},
    {"rank": 3, "name": "Player Name", "matchesPlayed": 9999999},
    {"rank": 3, "name": "Player Name", "matchesPlayed": 9999999},
    {"rank": 3, "name": "Player Name", "matchesPlayed": 9999999},
    {"rank": 3, "name": "Player Name", "matchesPlayed": 9999999},
    // Add more data as needed
  ];

  final userRank = 99999;
  final userName = "Your Name";
  final userMatchesPlayed = 9999999;

  @override
  Widget build(BuildContext context) {
    return
        ListView.builder(
          itemCount: leaderboardData.length, // demo
          itemBuilder: (context, index) {
            var player = leaderboardData[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    player['rank'].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(
                    player['name'].toString(), style: TextStyle(color: Colors.black)),
                trailing: Text(
                  player['matchesPlayed'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        );
  }
}