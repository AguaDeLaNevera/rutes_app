import 'package:flutter/material.dart';
import 'package:rutes_app/models/route_card.dart';
import 'package:rutes_app/screens/route_details_screen.dart';

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recorded Routes'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/img/mountain.jpg'),
            fit: BoxFit.cover,

          ),
        ),
        child: FutureBuilder(
          // Replace this with your API fetching logic
          future: fetchRoutesFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching routes'),
              );
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return Center(
                child: Text('No routes available'),
              );
            } else {
              List<RouteCard> routeCards = (snapshot.data as List).map((route) {
                return RouteCard(
                  routeName: route['name'],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteDetailsScreen(route: route),
                      ),
                    );
                  },
                );
              }).toList();

              return ListView(
                padding: EdgeInsets.all(16.0),
                children: routeCards,
              );
            }
          },
        ),
      ),
    );
  }

  // Replace this with your API fetching logic
  Future<List<Map<String, dynamic>>> fetchRoutesFromApi() async {
    // Simulating API call delay
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your API data
    List<Map<String, dynamic>> routes = [
      {'name': 'Route to Midgard', 'details': 'Details for Route to Midgard'},
      {'name': 'Another Route', 'details': 'Details for Another Route'},
      // Add more routes
    ];

    return routes;
  }
}
