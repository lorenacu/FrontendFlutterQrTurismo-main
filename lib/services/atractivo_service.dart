import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class AtractivosService extends ChangeNotifier {
  final String _baseUrl = 'http://localhost:8080/atractivo_turistico/';
  static final List<Atractivo> atractivos = [];

  //static bool isLoading = false;

  //bool isLoading = true;
  AtractivosService() {
    print('entro');
    this.loadAtractivos();
  }

  Future<List<Atractivo>> loadAtractivos() async {
    print('entro');
    //isLoading = true;
    //notifyListeners();

    final url = Uri.https(_baseUrl, 'lista');
    final resp = await http.get(url);
    print('entro');
    final Map<String, dynamic> atractivosMap = json.decode(resp.body);

    atractivosMap.forEach((key, data) {
      final tempAtractivo = Atractivo.fromMap(data);
      tempAtractivo.idAtractivo = key as int;
      tempAtractivo.nombreAtractivo = data;

      atractivos.add(tempAtractivo);
    });
    //isLoading = false;
    //notifyListeners();
    return atractivos;
  }
/*
  Future loadAtractivos() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'lista');
    final response = await http.get(url);
    print(response);
    return json.decode(response.body);
  }*/
}
