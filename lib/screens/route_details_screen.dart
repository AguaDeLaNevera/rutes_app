import 'package:flutter/material.dart';
import 'package:rutes_app/models/ruta.dart';

class RouteDetailsScreen extends StatelessWidget {
  final Ruta route;

  const RouteDetailsScreen({required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route.nombre),
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
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Route Name: ${route.nombre}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Details: ${route.descripcion}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 16),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Add logic for sharing the route
                  },
                ),
                // Add more details or content as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
