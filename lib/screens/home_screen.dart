import 'package:flutter/material.dart';
import 'package:rutes_app/models/user.dart';
import 'package:rutes_app/providers/user_provider.dart';
import 'package:rutes_app/screens/settings_screen.dart';
import 'package:rutes_app/screens/record_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context);
    List<User> userList = userProvider.users;
    bool isMiles = false;
    
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
                  builder: (context) => RecordScreen(userId: userList[0].id),
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
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              userList = userProvider.getUsers();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'lib/img/mountain.jpg',
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: userList[0].avatar != null && userList[0].avatar.isNotEmpty
                        ? NetworkImage(userList[0].avatar) as ImageProvider<Object>
                        : AssetImage('lib/img/hike.jpg'),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Hiker!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            'Embark on a journey through nature and discover the thrill of hiking. Your next adventure awaits!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.043,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stats:',
                            style: TextStyle(
                              fontSize: screenWidth * 0.0435,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          StatCard(label: 'Routes Created', value: userList[0].stats.routesCreated.toString()),
                          StatCard(label: 'Routes Completed', value: userList[0].stats.routesCompleted.toString()),
                          StatCard(label: 'Likes Received', value: userList[0].stats.likesReceived.toString()),
                          isMiles == false
                          ? StatCard(label: 'Total Kilometers', value: userList[0].stats.totalKilometers.toString())
                          : StatCard(label: 'Total Miles', value: (userList[0].stats.totalKilometers*0.62).toString()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You might wanna see what these people are up to!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.043,
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: Container(
                              height: screenHeight * 0.1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  User user = userList[index];
                                  return Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.005),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecordScreen(userId: userList[index].id),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: screenWidth * 0.212,
                                        height: screenWidth * 0.12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: ClipOval(
                                        child: user.avatar != null && user.avatar.isNotEmpty
                                            ? Image.network(
                                                user.avatar,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'lib/img/hike.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
              ),
              onPressed: () {
                // Add logic for "Create Your Own Routes" button
              },
              child: Icon(
                Icons.add,
                size: screenWidth * 0.06,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
              ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordScreen(userId: null),
                ),
              );
              },
              child: Icon(
                Icons.search,
                size: screenWidth * 0.06,
              ),
            ),
          ],
        ),
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
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04325, color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04325, color: Colors.white),
        ),
      ],
    );
  }
}
