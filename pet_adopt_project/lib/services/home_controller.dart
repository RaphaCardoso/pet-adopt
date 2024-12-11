import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getPets(page) async {
  print(page);
  final response = await http.get(Uri.parse(
      'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets?page=$page&limit=8'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Erro: ${response.statusCode}');
    print('Resposta: ${response.body}');
    throw Exception('Erro ao listar pets.');
  }
}
