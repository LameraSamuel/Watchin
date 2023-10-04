import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'myapp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(0, 0, 0, 0),
    systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
  ));
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
