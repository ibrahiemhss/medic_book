import 'package:flutter/material.dart';
import 'package:medic_book/widgets/Leaderboard/LeaderboardContent.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
        centerTitle: true,
        elevation: 0,
      ),
      body: LeaderboardContent(),
    );
  }
}
