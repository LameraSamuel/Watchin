import 'package:flutter/material.dart';
import 'package:gvpneus/Line2/Line2.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/snackbar2/snackbar2.dart';

class Consulta extends StatefulWidget {
  String data_saida;
  String horario_saida;
  String data_entrada;
  String horario_entrada;
  String placa;
  String modelo;
  String documento;
  String nome;
  //string teste;

  Consulta(
      {required this.data_entrada,
      required this.data_saida,
      required this.horario_saida,
      required this.horario_entrada,
      required this.placa,
      required this.modelo,
      required this.documento,
      required this.nome,
      super.key});

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
                          children: [
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
                              displayText: 'DATA SAIDA: ${widget.data_saida}',
                            ),
                            Line2(
                              displayText:
                                  'HORARIO SAIDA: ${widget.horario_saida}',
                            ),
                            Line2(
                              displayText:
                                  'DATA ENTRADA: ${widget.data_entrada}',
                            ),
                            Line2(
                              displayText:
                                  'HORARIO ENTRADA: ${widget.horario_entrada}',
                            ),
                            Line2(
                              displayText: 'PLACA: ${widget.placa}',
                            ),
                            Line2(
                              displayText: 'MODELO VEICULO: ${widget.modelo}',
                            ),
                            Line2(
                              displayText:
                                  'DOCUMENTO MOTORISTA: ${widget.documento}',
                            ),
                            Line2(
                              displayText: 'NOME MOTORISTA: ${widget.nome}',
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
