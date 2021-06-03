import 'package:carrot/config/color.dart';
import 'package:carrot/page/splash/splash.dart';
import 'package:carrot/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrot',
      theme: ThemeData(
        primarySwatch: AppColor().primary,
      ),
      home: SplashScreen()
    );
  }
}
