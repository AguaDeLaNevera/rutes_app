import 'package:flutter/material.dart';
import 'package:rutes_app/models/user.dart';
import 'package:rutes_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
    final userProvider = Provider.of<UserProvider>(context);
    List<User> userList = userProvider.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Image.asset(
            'lib/img/mountain.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 60, // Increased the radius to make the image bigger
                          backgroundImage: userList[0].avatar != null && userList[0].avatar.isNotEmpty
                            ? NetworkImage(userList[0].avatar) as ImageProvider<Object>
                            : AssetImage('lib/img/hike.jpg'),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Add logic to handle edit profile picture
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Username: John Doe', style: TextStyle(color: Colors.white)),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Add logic to handle edit username
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email: example@example.com', style: TextStyle(color: Colors.white)),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Add logic to handle edit email
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Password: ********', style: TextStyle(color: Colors.white)),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Add logic to handle edit password
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'App Preferences',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SwitchListTile(
                            title: Text('Enable Route Tracking', style: TextStyle(color: Colors.black)),
                            value: enableTracking,
                            onChanged: (value) {
                              setState(() {
                                enableTracking = value;
                              });
                            },
                            activeColor: Colors.black, // Set the active color to black
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Units', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                                      activeColor: Colors.white, // Set the active color to white
                                    ),
                                    Text('Kilometers', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    Radio(
                                      value: 1,
                                      groupValue: distanceUnit,
                                      onChanged: (value) {
                                        setState(() {
                                          distanceUnit = value as int;
                                        });
                                      },
                                      activeColor: Colors.white, // Set the active color to white
                                    ),
                                    Text('Miles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                                      activeColor: Colors.white, // Set the active color to white
                                    ),
                                    Text('km/h', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    Radio(
                                      value: 1,
                                      groupValue: speedUnit,
                                      onChanged: (value) {
                                        setState(() {
                                          speedUnit = value as int;
                                        });
                                      },
                                      activeColor: Colors.white, // Set the active color to white
                                    ),
                                    Text('mph', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Add logic for "Create Your Own Routes" button
                      },
                      child: Text('Log Out'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
