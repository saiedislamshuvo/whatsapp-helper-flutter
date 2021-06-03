import 'dart:async';

import 'package:carrot/config/config.dart';
import 'package:carrot/helpers/screen_navigation.dart';
import 'package:carrot/page/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, init);
  }

  void init() async {
    ScreenNavigator.replacementScreen(context, Dashboard());
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(Config().appIcon, fit: BoxFit.cover, width: 100,)
              )
            ],
          ),
        ),
      ),
    );
  }
}