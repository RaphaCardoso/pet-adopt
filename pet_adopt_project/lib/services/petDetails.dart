import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> petsDetails(idDetails) async {
  final response = await http.get(
    Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/${idDetails}'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Erro: ${response.statusCode}');
    print('Resposta: ${response.body}');
    throw Exception('Erro ao listar pets do user.');
  }
}
