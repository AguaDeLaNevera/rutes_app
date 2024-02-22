import 'package:flutter/material.dart';

class RouteCard extends StatelessWidget {
  final String routeName;
  final VoidCallback onPressed;

  const RouteCard({required this.routeName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.black.withOpacity(0.7),
      child: ListTile(
        title: Text(
          routeName,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        onTap: onPressed,
      ),
    );
  }
}
