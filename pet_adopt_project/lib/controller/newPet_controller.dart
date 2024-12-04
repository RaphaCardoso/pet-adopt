import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pet_adopt_project/models/pet_model.dart';

Future<Map<String, dynamic>> registerNewPet(PetModel pet) async {
  await initLocalStorage();

  var token = localStorage.getItem("token");

  final response = await http.post(
    Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/create'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(pet),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    print('Erro: ${response.statusCode}');
    print('Resposta: ${response.body}');
    throw Exception('Erro ao cadastrar novo pet.');
  }
}
