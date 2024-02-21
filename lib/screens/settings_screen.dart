import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController nameController = TextEditingController();
  bool enableTracking = true;
  bool darkMode = false;
  int distanceUnit = 0; // 0 for kilometers, 1 for miles
  int speedUnit = 0; // 0 for km/h, 1 for mph

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 20),
              Text(
                'App Preferences',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SwitchListTile(
                title: Text('Enable Route Tracking'),
                value: enableTracking,
                onChanged: (value) {
                  setState(() {
                    enableTracking = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                    // You can implement logic to change the app's theme here
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Units'),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: distanceUnit,
                    onChanged: (value) {
                      setState(() {
                        distanceUnit = value as int;
                      });
                    },
                  ),
                  Text('Kilometers'),
                  Radio(
                    value: 1,
                    groupValue: distanceUnit,
                    onChanged: (value) {
                      setState(() {
                        distanceUnit = value as int;
                      });
                    },
                  ),
                  Text('Miles'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: speedUnit,
                    onChanged: (value) {
                      setState(() {
                        speedUnit = value as int;
                      });
                    },
                  ),
                  Text('km/h'),
                  Radio(
                    value: 1,
                    groupValue: speedUnit,
                    onChanged: (value) {
                      setState(() {
                        speedUnit = value as int;
                      });
                    },
                  ),
                  Text('mph'),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Save user settings logic here
                  // You can use the values from controllers and state variables
                  // Update user information and app preferences as needed
                },
                child: Text('Save Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
