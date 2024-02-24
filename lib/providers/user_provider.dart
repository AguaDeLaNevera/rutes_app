import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:rutes_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  String _baseUrl = 'https://firebase-login-98-default-rtdb.europe-west1.firebasedatabase.app';
  String _endpoint = '/users.json';

  List<User> users = [];

  UserProvider() {
    print('User Provider initialized!');
    this.getUsers();
  }

  getUsers() async {
    var url = Uri.parse('$_baseUrl$_endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        users = jsonResponse.entries.map((entry) {
          return User.fromJson({'id': entry.key, ...entry.value});
        }).toList();
        
        notifyListeners();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}