import 'package:flutter/material.dart';
import 'package:gvpneus/consulta/consulta.dart';

class But extends StatefulWidget {
  But({
    Key? key,
    required this.indexClick,
    required this.hintText,
    required this.data_entrada,
    required this.data_saida,
    required this.horario_saida,
    required this.horario_entrada,
    required this.modelo,
    required this.documento,
    required this.nome,
    required this.placa,
    this.width = 350,
    this.height = 50,
  }) : super(key: key);

  final String hintText;
  final double width;

  final double height;
  int indexClick;
  String data_saida;
  String horario_saida;
  String data_entrada;
  String horario_entrada;
  String placa;
  String modelo;
  String documento;
  String nome;

  @override
  State<But> createState() => _ButState();
}

class _ButState extends State<But> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consulta(
                        indexClick: widget.indexClick,
                        data_entrada: widget.data_entrada,
                        data_saida: widget.data_saida,
                        horario_saida: widget.horario_saida,
                        horario_entrada: widget.horario_entrada,
                        placa: widget.placa,
                        modelo: widget.modelo,
                        documento: widget.documento,
                        nome: widget.nome),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: const Color.fromARGB(255, 162, 161, 161),
              ),
              child: Center(
                child: Text(
                  widget.hintText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
