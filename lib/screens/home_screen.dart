import 'package:flutter/material.dart';
import 'package:rutes_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/img/mountain.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: GestureDetector(
              onTap: () {
                _showUserDetailsDialog(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('lib/img/hike.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Welcome Hiker!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(217, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Embark on a journey through nature and discover the thrill of hiking. Your next adventure awaits!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add logic for "Create Your Own Routes" button
                    },
                    child: Text('Create Your Own Routes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic for "Explore New Routes" button
                    },
                    child: Text('Explore New Routes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUserDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("User Details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
