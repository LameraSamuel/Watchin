import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gvpneus/Line/line.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/snackbar1/snackbar1.dart';
import 'package:http/http.dart' as http;

class Saida extends StatefulWidget {
  String? recognizedText;
  Saida({this.recognizedText, Key? key}) : super(key: key);

  @override
  State<Saida> createState() => _SaidaState();
}

class _SaidaState extends State<Saida> {
  final dataSaidaController = TextEditingController();
  final horarioSaidaController = TextEditingController();
  final placaController = TextEditingController();
  final modeloVeiculoController = TextEditingController();
  final dataEntradaController = TextEditingController();
  final horarioEntradaController = TextEditingController();
  final documentoMotoristaController = TextEditingController();
  final nomeMotoristaController = TextEditingController();

  bool dadosEnviadosComSucesso = false;

  @override
  void initState() {
    super.initState();

    dataSaidaController.text =
        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
    horarioSaidaController.text =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";

    placaController.addListener(() {
      if (placaController.text.isNotEmpty) {
        preencherCamposComDados(placaController.text);
      }
    });
  }

  void preencherCamposComDados(String placa) async {
    final url = Uri.parse('http://192.168.0.18:5000/Veiculos_entrada/$placa/1');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));

        if (responseData.isNotEmpty) {
          final veiculo = responseData.values.first;

          DateTime? dataEntrada;
          DateTime? horarioEntrada;

          try {
            dataEntrada = DateTime.parse(veiculo['DataEntrada']);
          } catch (e) {
            print('Erro ao converter data de entrada: $e');
          }

          try {
            horarioEntrada = DateTime.parse(
              '1970-01-01T${veiculo['HorarioEntrada'].split(':').join(':00')}Z',
            ).toLocal();
          } catch (e) {
            print('Erro ao converter horário de entrada: $e');
          }

          setState(() {
            dataSaidaController.clear();
            horarioSaidaController.clear();
            placaController.clear();
            modeloVeiculoController.clear();
            dataEntradaController.clear();
            horarioEntradaController.clear();
            documentoMotoristaController.clear();
            nomeMotoristaController.clear();

            dataSaidaController.text =
                "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
            horarioSaidaController.text =
                "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";
            placaController.text = veiculo['Placa'];
            modeloVeiculoController.text = veiculo['Modelo'];
            dataEntradaController.text =
                "${dataEntrada?.year}-${dataEntrada?.month.toString().padLeft(2, '0')}-${dataEntrada?.day.toString().padLeft(2, '0')}";
            horarioEntradaController.text =
                "${horarioEntrada?.hour.toString().padLeft(2, '0')}:${horarioEntrada?.minute.toString().padLeft(2, '0')}";
            documentoMotoristaController.text = veiculo['DocumentoMotorista'];
            nomeMotoristaController.text = veiculo['NomeMotorista'];
          });
        } else {
          print('Nenhum dado encontrado para a placa $placa');
        }
      } else {
        print('Erro ao obter dados do veículo: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro na solicitação: $e');
    }
  }

  Future<bool> enviarDadosParaEndpoints() async {
    final url = Uri.parse('http://192.168.0.18:5000/veiculos_saida');

    final body = {
      "data_saida": dataSaidaController.text,
      "horario_saida": horarioSaidaController.text,
      "placa": placaController.text,
      "modelo": modeloVeiculoController.text,
      "data_entrada": dataEntradaController.text,
      "horario_entrada": horarioEntradaController.text,
      "documento_motorista": documentoMotoristaController.text,
      "nome_motorista": nomeMotoristaController.text,
      "CampoInt": "0",
    };

    print("Dados enviados para o backend: $body");

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      print("Resposta do servidor: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          dadosEnviadosComSucesso = true;
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

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
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                'DADOS DE SAIDA',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Line(
                              hintText: 'DATA SAIDA',
                              controller: dataSaidaController,
                            ),
                            Line(
                              hintText: 'HORARIO SAIDA',
                              controller: horarioSaidaController,
                            ),
                            Line(
                              hintText: 'PLACA',
                              controller: placaController,
                            ),
                            Line(
                              hintText: 'MODELO VEICULO',
                              controller: modeloVeiculoController,
                            ),
                            Line(
                              hintText: 'DATA ENTRADA',
                              controller: dataEntradaController,
                            ),
                            Line(
                              hintText: 'HORARIO ENTRADA',
                              controller: horarioEntradaController,
                            ),
                            Line(
                              hintText: 'DOCUMENTO MOTORISTA',
                              controller: documentoMotoristaController,
                            ),
                            Line(
                              hintText: 'NOME MOTORISTA',
                              controller: nomeMotoristaController,
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
              child: Snack(enviarDadosParaEndpoint: enviarDadosParaEndpoints),
            ),
          ],
        ),
      ),
    );
  }
}
