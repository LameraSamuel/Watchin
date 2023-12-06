class Resultados {
  String? placa;
  String? dataEntrada;
  String? dataSaida;
  String? horarioEntrada;
  String? horarioSaida;
  String? modeloConsulta;
  String? nomeConsulta;
  String? documentoConsulta;

  Resultados(
      { //String placa,
      //String dataEntrada,
      //String dataSaida,
      //String horarioEntrada,
      //String horarioSaida,
      //String modeloConsulta,
      //String nomeConsulta,
      //String documentoConsulta,
      required this.placa,
      required this.dataEntrada,
      required this.dataSaida,
      required this.horarioEntrada,
      required this.horarioSaida,
      required this.modeloConsulta,
      required this.nomeConsulta,
      required this.documentoConsulta});

  factory Resultados.fromJson(Map<String, dynamic> json) {
    return Resultados(
      placa: json['Placa'] ?? "",
      dataEntrada: json['DataEntrada'] ?? "",
      dataSaida: json['DataSaida'] ?? "",
      horarioEntrada: json['HorarioEntrada'] ?? "",
      horarioSaida: json['HorarioSaida'] ?? "",
      modeloConsulta: json['Modelo'] ?? "",
      nomeConsulta: json['NomeMotorista'] ?? "",
      documentoConsulta: json['DocumentoMotorista'] ?? "",
    );
  }
}
