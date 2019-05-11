class Palestra {
  String sala;
  String hora;
  String titulo;
  String palestrante;
  String nivel;

  Palestra({
    this.sala,
    this.hora,
    this.titulo,
    this.palestrante,
    this.nivel,
  });

  factory Palestra.fromJson(Map<String, dynamic> json) => new Palestra(
        sala: json["sala"],
        hora: json["hora"],
        titulo: json["titulo"],
        palestrante: json["palestrante"],
        nivel: json["nivel"],
      );

  Map<String, dynamic> toJson() => {
        "sala": sala,
        "hora": hora,
        "titulo": titulo,
        "palestrante": palestrante,
        "nivel": nivel,
      };
}
