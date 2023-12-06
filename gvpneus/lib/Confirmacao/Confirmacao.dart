import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget {
  const TelaConfirmacao({Key? key, required this.mensagem, required this.rota})
      : super(key: key);

  final String mensagem;
  final bool rota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            rota
                ? Navigator.of(context).pushNamed("/homepage")
                : Navigator.of(context).pushNamed("/homepage");
          },
          child: Container(
            color: const Color.fromARGB(255, 253, 207, 41),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  ' PROCESSO CONCLUIDO COM SUCESSO! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 125,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'PRESSIONE A TELA PARA PROSSEGUIR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
