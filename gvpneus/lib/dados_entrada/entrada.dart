import 'package:flutter/material.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/snackbar/snackbar.dart';
import 'package:gvpneus/module/module.dart';
import 'package:gvpneus/Line/line.dart';
import 'package:gvpneus/snackbar1/snackbar1.dart';

class Entrada extends StatefulWidget {
  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final senhaController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ProfileBar(
                      exibirSaud: true,
                      exibirBack: false,
                    ),
                  ),
                  Container(
                    height: 610,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 253, 207, 41),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                'DADOS DE ENTRADA',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Line(
                              hintText: 'PLACA',
                            ),
                            Line(
                              hintText: 'MODELO VEICULO',
                            ),
                            Line(
                              hintText: 'DATA ENTRADA',
                            ),
                            Line(
                              hintText: 'HORARIO ENTRADA',
                            ),
                            Line(
                              hintText: 'DOCUMENTO MOTORISTA',
                            ),
                            Line(
                              hintText: 'NOME MOTORISTA',
                            ),
                            Line(
                              hintText: 'DOCUMENTO AJUDANTE',
                            ),
                            Line(
                              hintText: 'NOME AJUDANTE',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Snack(),
            ),
          ],
        ),
      ),
    );
  }
}
