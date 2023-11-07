import 'package:flutter/material.dart';
import 'package:gvpneus/camera/camera.dart';
import 'package:gvpneus/module/module.dart';
import 'package:gvpneus/profilebar/profilebar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView(
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
                  height: 600,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 253, 207, 41),
                  child: Center(
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/Entrada'),
                            child: ModuleCard(
                              iconModule: 'assets/Direita.png',
                              textModule: 'ENTRADA',
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CameraPage(isEntrada: false))),
                            child: ModuleCard(
                              iconModule: 'assets/esquerda.png',
                              textModule: 'SAIDA',
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 8),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed('/Rel'),
                            child: ModuleCard(
                              iconModule: 'assets/lupa.png',
                              textModule: 'CONSULTAR',
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
