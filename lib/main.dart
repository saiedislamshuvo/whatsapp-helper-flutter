import 'package:whatsapp_helper/config/color.dart';
import 'package:whatsapp_helper/config/config.dart';
import 'package:whatsapp_helper/page/splash/splash.dart';
import 'package:whatsapp_helper/providers/app_provider.dart';
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
      title: Config.appName,
      theme: ThemeData(
        primarySwatch: AppColor().secondary,
      ),
      home: SplashScreen(),
    );
  }
}
