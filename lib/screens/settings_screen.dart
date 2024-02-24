import 'package:flutter/material.dart';
import 'package:rutes_app/models/user.dart';
import 'package:rutes_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rutes_app/screens/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  final User user;
  const SettingsScreen({Key? key, required this.user}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomeScreen when back arrow is pressed
           Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
          },
        ),
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
                          backgroundImage: widget.user.avatar != null && widget.user.avatar.isNotEmpty
                            ? NetworkImage(widget.user.avatar) as ImageProvider<Object>
                            : AssetImage('lib/img/hike.jpg'),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _editProfileAvatar(userProvider, widget.user.id);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Username: '+widget.user.username, style: TextStyle(color: Colors.white)),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _editProfileUsername(userProvider, widget.user.id);
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
void _editProfileUsername(UserProvider upv, String id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black.withOpacity(1),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () async {
              // Show CircularProgressIndicator while saving
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );

              String newUsername = nameController.text;
              await upv.updateUserUsername(id, newUsername);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context); // Close the CircularProgressIndicator dialog

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(user: upv.getUserById(id)),
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(16.0),
      );
    },
  );
}

void _editProfileAvatar(UserProvider upv, String id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black.withOpacity(1),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Avatar',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () async {
              // Show CircularProgressIndicator while saving
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );

              String newUsername = nameController.text;
              await upv.updateUserAvatar(id, newUsername);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context); // Close the CircularProgressIndicator dialog

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(user: upv.getUserById(id)),
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(16.0),
      );
    },
  );
}

}
