import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:uplisten/screens/app.dart';
import 'package:uplisten/state/playerState.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _mockCheckForSession().then((val) {
      _navigateToHome();
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 2), () {});
    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/icon.png',height: 120,),),
          const SizedBox(height: 20,),
          Center(child: Text(
            "Uplisten",
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 36.0,
              ),
            ),
          ),)
        ],
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PlayerStore>(
      create: (ctx) => PlayerStore(),
      child: App(),
    );
  }
}