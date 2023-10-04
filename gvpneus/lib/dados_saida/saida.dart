import 'package:flutter/material.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/Line/line.dart';
import 'package:gvpneus/snackbar1/snackbar1.dart';

class Saida extends StatefulWidget {
  const Saida({super.key});

  @override
  State<Saida> createState() => _SaidaState();
}

class _SaidaState extends State<Saida> {
  @override
  Widget build(BuildContext context) {
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
                                'DADOS DE SAIDA',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Line(
                              hintText: 'DATA SAIDA',
                            ),
                            Line(
                              hintText: 'HORARIO SAIDA',
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
