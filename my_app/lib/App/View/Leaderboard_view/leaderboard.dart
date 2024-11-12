


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Widgets/HeroPlayer.dart';
import '../Widgets/LeaderBoardUserPosition.dart';
import '../Widgets/LeaderboardList.dart';

class Leaderboard extends GetView{
@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Leaderboard', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          HeroPlayer(),
          Expanded(child: Leaderboardlist()),
          Leaderboarduserposition(),
        ],
      ),
    );
  }



}