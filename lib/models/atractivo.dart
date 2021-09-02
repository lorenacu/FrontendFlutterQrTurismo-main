// To parse this JSON data, do
//
//     final atractivo = atractivoFromMap(jsonString);

import 'dart:convert';

class Atractivo {
    Atractivo({
        required this.idAtractivo,
        required this.nombreAtractivo,
        required this.descripcionAtractivo,
    });

    int idAtractivo;
    String nombreAtractivo;
    String descripcionAtractivo;

    factory Atractivo.fromJson(String str) => Atractivo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Atractivo.fromMap(Map<String, dynamic> json) => Atractivo(
        idAtractivo: json["idAtractivo"],
        nombreAtractivo: json["nombreAtractivo"],
        descripcionAtractivo: json["descripcionAtractivo"],
    );

    Map<String, dynamic> toMap() => {
        "idAtractivo": idAtractivo,
        "nombreAtractivo": nombreAtractivo,
        "descripcionAtractivo": descripcionAtractivo,
    };
}
