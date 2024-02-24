import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rutes_app/models/ruta.dart';

class RutaProvider extends ChangeNotifier {
  String _baseUrl =
      'https://mmartorellrs2p-default-rtdb.europe-west1.firebasedatabase.app';
  String _endpoint = '/rutas.json';

  List<Ruta> rutas = [];

  RutaProvider() {
    print('Ruta Provider initialized!');
    this.getRutas();
  }

  getRutas() async {
    var url = Uri.parse('$_baseUrl$_endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse =
            jsonDecode(response.body) as Map<String, dynamic>;

        rutas = jsonResponse.entries.map((entry) {
          return Ruta.fromJson(entry.key, entry.value);
        }).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load rutas');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> updateRutaAvatar(String id, String newAvatarUrl) async {
    final String url = '$_baseUrl/rutas/$id.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> rutaData = json.decode(response.body);

        // Update the avatar field
        rutaData['avatar'] = newAvatarUrl;

        // Send the updated ruta data to the API
        final updateResponse = await http.patch(
          Uri.parse(url),
          body: json.encode(rutaData),
        );

        if (updateResponse.statusCode == 200) {
          print('Avatar updated successfully');
        } else {
          print('Failed to update avatar');
        }
      } else {
        print('Failed to fetch ruta data');
      }
    } catch (error) {
      print('Error updating avatar: $error');
      throw error;
    }
    getRutas();
    notifyListeners();
  }
 List<Ruta> getRutasUser(String userId) {
  // Filter the list of routes based on the given userId
  return rutas.where((ruta) => ruta.userId == userId).toList();
}
}