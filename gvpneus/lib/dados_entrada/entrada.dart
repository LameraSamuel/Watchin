import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:gvpneus/Line/line.dart';
import 'package:gvpneus/snackbar1/snackbar1.dart';
import 'package:http/http.dart' as http;

class Entrada extends StatefulWidget {
  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final placaController = TextEditingController();
  final modeloController = TextEditingController();
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final documentoController = TextEditingController();

  TextEditingController dataController = TextEditingController();
  TextEditingController horaController = TextEditingController();

  bool dadosEnviadosComSucesso = false;

  @override
  void initState() {
    super.initState();

    dataController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    horaController.text = "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
  }

  void fetchModelo(String placa) async {
    try {
      final response = await http.get(Uri.parse(
          'https://wdapi2.com.br/consulta/GPJ1534/0b03c72e243f3809d90524612e92948a?placa=$placa'));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        final modelo = responseData['modelo'];

        setState(() {
          modeloController.text = modelo;
        });
      } else {
        // print('Error fetching modelo: ${response.statusCode}');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Erro ao buscar modelo do veículo'),
        //   ),
        // );
      }
    } on Exception catch (e) {}
  }

  void fetchNome(String cpf) async {
    final url =
        'https://api.cpfcnpj.com.br/4fa6db123243984324f58d673a1c2ad8/9/$cpf';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        final nome = responseData['nome'];

        final nomeExibido = nome.length <= 30 ? nome : nome.substring(0, 30);

        setState(() {
          nomeController.text = nomeExibido;
        });
      } else {
        print(
            'Erro na solicitação: ${response.reasonPhrase} (${response.statusCode})');
      }
    } on Exception catch (e) {
      print('Erro na solicitação: $e');
    }
  }

  Future<bool> enviarDadosParaEndpoint() async {
    final url = Uri.parse('http://192.168.0.18:5000/veiculos_entrada');

    final body = {
      "placa": placaController.text,
      "modelo": modeloController.text,
      "data_entrada":
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}T${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:00Z",
      "horario_entrada": "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
      "documento_motorista": cpfController.text,
      "nome_motorista": nomeController.text,
    };

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

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
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                'DADOS DE ENTRADA',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Line(
                              hintText: 'PLACA',
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  fetchModelo(value);
                                }
                              },
                              controller: placaController,
                            ),
                            Line(
                              hintText: 'MODELO VEICULO',
                              controller: modeloController,
                            ),
                            Line(
                              hintText: 'DATA ENTRADA',
                              controller: dataController,
                            ),
                            Line(
                              hintText: 'HORARIO ENTRADA',
                              controller: horaController,
                            ),
                            Line(
                              hintText: 'DOCUMENTO MOTORISTA',
                              onChanged: (value) {
                                if (value.isNotEmpty && value.length >= 11) {
                                  fetchNome(value);
                                }
                              },
                              controller: cpfController,
                            ),
                            Line(
                              hintText: 'NOME MOTORISTA',
                              controller: nomeController,
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
              child: Snack(
                enviarDadosParaEndpoint: enviarDadosParaEndpoint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
