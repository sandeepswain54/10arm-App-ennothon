import 'package:flutter/material.dart';
import 'package:newbhu/logistics_main_page.dart';


class LogisticsApp extends StatelessWidget {
  const LogisticsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogisticsMainPage(),
    );
  }
}