import 'package:flutter/material.dart';
import 'package:gvpneus/Erro/Erro.dart';
import 'package:gvpneus/Confirmacao/Confirmacao.dart';

class Snack extends StatelessWidget {
  final Function enviarDadosParaEndpoint;

  const Snack({super.key, required this.enviarDadosParaEndpoint});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () async {
                  bool sucesso = await enviarDadosParaEndpoint();
                  if (sucesso) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TelaConfirmacao(
                          mensagem: 'USUARIO',
                          rota: false,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const Erro()));
                  }
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: FloatingActionButton(
                heroTag: 'ent',
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Erro()));
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
