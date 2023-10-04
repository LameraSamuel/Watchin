import 'package:flutter/material.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/Line2/Line2.dart';
import 'package:gvpneus/snackbar2/snackbar2.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
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
                                'DADOS DE ENTRADA/SAIDA:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Line2(
                              displayText: 'DATA SAIDA:',
                            ),
                            Line2(
                              displayText: 'HORARIO SAIDA:',
                            ),
                            Line2(
                              displayText: 'DATA ENTRADA:',
                            ),
                            Line2(
                              displayText: 'HORARIO ENTRADA:',
                            ),
                            Line2(
                              displayText: 'PLACA:',
                            ),
                            Line2(
                              displayText: 'MODELO VEICULO:',
                            ),
                            Line2(
                              displayText: 'DOCUMENTO MOTORISTA:',
                            ),
                            Line2(
                              displayText: 'NOME MOTORISTA:',
                            ),
                            Line2(
                              displayText: 'DOCUMENTO AJUDANTE:',
                            ),
                            Line2(
                              displayText: 'NOME AJUDANTE:',
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
              padding: const EdgeInsets.all(10.0),
              child: Snack2(),
            ),
          ],
        ),
      ),
    );
  }
}
