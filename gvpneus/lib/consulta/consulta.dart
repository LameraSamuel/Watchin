import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gvpneus/Line2/Line2.dart';
import 'package:gvpneus/Relatorio/resultados.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/snackbar2/snackbar2.dart';
import 'package:http/http.dart' as http;
//string teste;

class Consulta extends StatefulWidget {
  int indexClick;
  String data_saida;
  String horario_saida;
  String data_entrada;
  String horario_entrada;
  String placa;
  String modelo;
  String documento;
  String nome;

  Consulta(
      {required this.indexClick,
      required this.data_entrada,
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
  List<Resultados> resultado = [];
  @override
  void initState() {
    getConsulta(widget.data_entrada);
    super.initState();
  }

  Future<void> getConsulta(String dataEntrada) async {
    String url =
        'http://Gvmatriz.dyndns.info:5000/veiculos_saida/data_entrada/$dataEntrada';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data;

      setState(() {
        resultado = results.map((e) => Resultados.fromJson(e)).toList();
      });
    } else {
      print('Falha na requisição. ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return resultado.isEmpty
        ? const CircularProgressIndicator()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Column(
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Text(
                                      'DADOS DE ENTRADA/SAIDA:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  Line2(
                                    displayText:
                                        'DATA SAIDA: ${resultado[widget.indexClick].dataSaida}',
                                  ),
                                  Line2(
                                    displayText:
                                        'HORARIO SAIDA: ${resultado[widget.indexClick].horarioSaida}',
                                  ),
                                  Line2(
                                    displayText:
                                        'DATA ENTRADA: ${resultado[widget.indexClick].dataEntrada}',
                                  ),
                                  Line2(
                                    displayText:
                                        'HORARIO ENTRADA: ${resultado[widget.indexClick].dataEntrada}',
                                  ),
                                  Line2(
                                    displayText:
                                        'PLACA: ${resultado[widget.indexClick].placa}',
                                  ),
                                  Line2(
                                    displayText:
                                        'MODELO VEICULO: ${resultado[widget.indexClick].modeloConsulta}',
                                  ),
                                  Line2(
                                    displayText:
                                        'DOCUMENTO MOTORISTA: ${resultado[widget.indexClick].documentoConsulta}',
                                  ),
                                  Line2(
                                    displayText:
                                        'NOME MOTORISTA: ${resultado[widget.indexClick].nomeConsulta}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Snack2(),
                  ),
                ],
              ),
            ));
  }
}
