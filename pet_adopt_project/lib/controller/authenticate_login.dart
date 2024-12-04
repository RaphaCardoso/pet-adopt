import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_adopt_project/models/login_model.dart';

Future<Map<String, dynamic>> login(LoginModel user) async {
  final response = await http.post(
    Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/login'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Erro: ${response.statusCode}');
    print('Resposta: ${response.body}');
    throw Exception('Erro ao criar o usuário.');
  }
}
