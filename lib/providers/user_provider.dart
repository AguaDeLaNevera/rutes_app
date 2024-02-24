import 'dart:convert';

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

  Future<void> updateUserAvatar(String id, String newAvatarUrl) async {
    final String url = '$_baseUrl/users/$id.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        
        // Update the avatar field
        userData['avatar'] = newAvatarUrl;

        // Send the updated user data to the API
        final updateResponse = await http.patch(
          Uri.parse(url),
          body: json.encode(userData),
        );

        if (updateResponse.statusCode == 200) {
          print('Avatar updated successfully');
        } else {
          print('Failed to update avatar');
        }
      } else {
        print('Failed to fetch user data');
      }
    } catch (error) {
      print('Error updating avatar: $error');
      throw error;
    }
    getUsers();
    notifyListeners();
  }
  Future<void> updateUserUsername(String id, String username) async {
    final String url = '$_baseUrl/users/$id.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        
        // Update the avatar field
        userData['username'] = username;

        // Send the updated user data to the API
        final updateResponse = await http.patch(
          Uri.parse(url),
          body: json.encode(userData),
        );

        if (updateResponse.statusCode == 200) {
          print('username updated successfully');
        } else {
          print('Failed to update username');
        }
      } else {
        print('Failed to fetch user data');
      }
    } catch (error) {
      print('Error updating avatar: $error');
      throw error;
    }
    getUsers();
    notifyListeners();
  }
}