import 'package:tictactoe/pages/game_page.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2500), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GamePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tic Tac Toe',
              style: TextStyle(
                fontSize: 44.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w800,
                fontFamily: "Cursive",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
