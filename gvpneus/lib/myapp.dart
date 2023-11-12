import 'package:flutter/material.dart';
import 'package:gvpneus/Relatorio/Relatorio.dart';
import 'package:gvpneus/consulta/consulta.dart';
import 'package:gvpneus/dados_entrada/entrada.dart';
import 'package:gvpneus/dados_saida/saida.dart';
import 'package:gvpneus/home/home.dart';
import 'package:gvpneus/homepage/homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/homepage': (context) => const Home(),
        '/Entrada': (context) => Entrada(),
        '/Saida': (context) => Saida(),
        '/Rel': (context) => const Rel(),
        '/Consulta': (context) => const Consulta(),
      },
    );
  }
}
