import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gvpneus/Button_rel/button.dart';
import 'package:gvpneus/profilebar/profilebar.dart';
import 'package:http/http.dart' as http;

class Rel extends StatefulWidget {
  const Rel({Key? key}) : super(key: key);

  @override
  State<Rel> createState() => _RelState();
}

class _RelState extends State<Rel> {
  DateTime? selectedDate;
  List<String> platesList = [];
  String data_saida = "";
  String horario_saida = "";
  String data_entrada = "";
  String horario_entrada = "";
  String placa = "";
  String modelo = "";
  String documento = "";
  String nome = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });

      await _pega_placa_data(selectedDate!);
    }
  }

  Future<void> _pega_placa_data(DateTime date) async {
    if (selectedDate != null) {
      String formattedDate =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      String url =
          'http://Gvmatriz.dyndns.info:5000/veiculos_saida/data_entrada/$formattedDate';

      try {
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200 || response.statusCode == 201) {
          List<String> plates = [];

          Map<String, dynamic> data = json.decode(response.body);

          data.forEach((key, entry) {
            if (entry.containsKey("Placa")) {
              String placa = entry["Placa"];
              String dataEntrada = entry["DataEntrada"];
              String dataSaida = entry["DataSaida"];
              String horarioEntrada = entry["HorarioEntrada"];
              String horarioSaida = entry["HorarioSaida"];
              String modeloConsulta = entry["Modelo"];
              String nomeConsulta = entry["NomeMotorista"];
              String documentoConsulta = entry["DocumentoMotorista"];

              plates.add(placa);
              data_entrada = dataEntrada;
              data_saida = dataSaida;
              horario_entrada = horarioEntrada;
              horario_saida = horarioSaida;
              modelo = modeloConsulta;
              nome = nomeConsulta;
              documento = documentoConsulta;
            }
          });

          setState(() {
            platesList = plates;
            data_entrada = data_entrada;
            data_saida = data_saida;
            horario_entrada = horario_entrada;
            horario_saida = horario_saida;
            modelo = modelo;
            nome = nome;
            documento = documento;
          });
        } else {
          print('Erro na requisição: ${response.statusCode}');
        }
      } catch (error) {
        print('Erro: $error');
      }
    } else {
      print('Selecione uma data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
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
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 253, 207, 41),
                  child: Center(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          color: Colors.black,
                          iconSize: 50,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/homepage');
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'CONSULTA DE VEICULOS',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          onPressed: () => _selectDate(context),
                          child: Text(
                            selectedDate != null
                                ? 'DATA: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                : 'Selecione a data',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Expanded(
                              child: SizedBox(
                                height: 500,
                                child: ListView.builder(
                                  itemBuilder: ((context, index) {
                                    if (index < platesList.length) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: But(
                                          hintText:
                                              'PLACA: ${platesList[index]}',
                                          data_entrada: data_entrada,
                                          data_saida: data_saida,
                                          horario_entrada: horario_entrada,
                                          horario_saida: horario_saida,
                                          modelo: modelo,
                                          documento: documento,
                                          nome: nome,
                                          placa: platesList[index],
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }),
                                  itemCount: platesList.length + 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
