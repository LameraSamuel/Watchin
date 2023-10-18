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
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  // Controladores para os campos de data e hora
  TextEditingController dataController = TextEditingController();
  TextEditingController horaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Preencha os controladores com os valores atuais
    dataController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    horaController.text = "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
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
                            ),
                            Line(
                              hintText: 'MODELO VEICULO',
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
