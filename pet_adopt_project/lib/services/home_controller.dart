import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getPets() async {
  final response = await http.get(Uri.parse(
      'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets?page=${5}&limit=6'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Erro: ${response.statusCode}');
    print('Resposta: ${response.body}');
    throw Exception('Erro ao listar pets.');
  }
}
