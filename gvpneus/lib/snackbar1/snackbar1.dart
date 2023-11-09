import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvpneus/homepage/homepage.dart';
import 'package:gvpneus/Erro/Erro.dart';
import 'package:gvpneus/Confirmacao/Confirmacao.dart';
import 'package:gvpneus/dados_entrada/entrada.dart';

class Snack extends StatelessWidget {
  final Function enviarDadosParaEndpoint;

  Snack({required this.enviarDadosParaEndpoint});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: FloatingActionButton(
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                backgroundColor: Colors.green,
                onPressed: () async {
                  bool sucesso = await enviarDadosParaEndpoint();
                  if (sucesso) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TelaConfirmacao(
                          mensagem: 'USUARIO',
                          rota: false,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Erro()));
                  }
                },
              ),
            ),
            Center(
              child: FloatingActionButton(
                heroTag: 'ent',
                child: Icon(
                  Icons.cancel,
                  color: Colors.black,
                ),
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Erro()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
