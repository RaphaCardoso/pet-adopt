import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

Future<Map<String, dynamic>> petsUser() async {
  await initLocalStorage();

  var token = localStorage.getItem("token");


  final response = await http.get(
    Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/mypets'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
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
