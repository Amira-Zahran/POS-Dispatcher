import 'dart:io';

import 'package:flutter/material.dart';

import 'config/API/badCertificateHandler.dart';
import 'config/Important/HiddenGlobal.dart';
import 'models/Three_Partions/home_page.dart';

void main(List<String> arguments) {
  HttpOverrides.global = new DevHttpOverrides();
  print(arguments);
  bLoC.login('omarr','123456789');

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dispatcher',
      home: Home_Page(),
    );
  }
}

