import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutes_app/models/route_card.dart';
import 'package:rutes_app/models/ruta.dart';
import 'package:rutes_app/models/user.dart';
import 'package:rutes_app/providers/ruta_provider.dart';
import 'package:rutes_app/providers/user_provider.dart';
import 'package:rutes_app/screens/route_details_screen.dart';

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rutaProvider = Provider.of<RutaProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    List<User> userList = userProvider.users;
    rutaProvider.getRutas();
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
        child: Consumer<RutaProvider>(
          builder: (context, rutaProvider, child) {
            if (rutaProvider.rutas.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<RouteCard> routeCards =
                  rutaProvider.getRutasUser(userList[0].id).map((ruta) {
                return RouteCard(
                  routeName: ruta.nombre,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteDetailsScreen(route: ruta),
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
}
