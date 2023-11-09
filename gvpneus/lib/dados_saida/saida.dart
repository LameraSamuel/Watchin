import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/Line/line.dart';
import 'package:gvpneus/snackbar1/snackbar1.dart';
import 'package:http/http.dart' as http;

class Saida extends StatefulWidget {
  const Saida({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    dataSaidaController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    horarioSaidaController.text =
        "${DateTime.now().hour}:${DateTime.now().minute}";
  }

  void enviarDadosParaEndpoints() async {
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

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados enviados com sucesso'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao enviar dados: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      print('Erro ao enviar dados: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro na conexão com o servidor'),
        ),
      );
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
