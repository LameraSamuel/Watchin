import 'package:flutter/material.dart';
import 'package:gvpneus/Button_rel/button.dart';
import 'package:gvpneus/profilebar/profilebar.dart';

class Rel extends StatefulWidget {
  const Rel({Key? key}) : super(key: key);

  @override
  State<Rel> createState() => _RelState();
}

class _RelState extends State<Rel> {
  DateTime? selectedDate;

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
                                  itemBuilder: ((context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: But(hintText: 'PLACA $index'),
                                      )),
                                  itemCount: 25,
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
