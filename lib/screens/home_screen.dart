import 'package:flutter/material.dart';
import 'package:rutes_app/screens/settings_screen.dart';
import 'package:rutes_app/screens/record_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking'),
        actions: [
          IconButton(
            icon: Icon(Icons.description),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/img/hike.jpg'),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Hiker!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Embark on a journey through nature and discover the thrill of hiking. Your next adventure awaits!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stats:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add your stat widgets here
                      StatCard(label: 'Routes Created', value: '10'),
                      StatCard(label: 'Routes Completed', value: '5'),
                      StatCard(label: 'Likes Received', value: '20'),
                      StatCard(label: 'Total Kilometers', value: '50'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You might wanna see what these people are up to!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 100, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of circles/users
                          itemBuilder: (context, index) {
                            // You can customize the circle/avatar for each user
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Add logic for when a circle is clicked
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecordScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 80, // Set the width as needed
                                  height: 80, // Set the height as needed
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  // Add any child widgets if needed, e.g., user avatar
                                  child: Center(
                                    child: Text(
                                      'user',
                                      style: TextStyle(fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.7),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            // Add logic for "Create Your Own Routes" button
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.7),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            // Add logic for "Explore New Routes" button
          },
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
      ],
    ),
  ),
),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
