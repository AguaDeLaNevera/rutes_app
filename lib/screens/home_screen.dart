import 'package:flutter/material.dart';
import 'package:plantilla_login_register/models/product.dart';
import 'package:plantilla_login_register/providers/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Information info = Provider.of<Information>(context);
    List<Product> productes = info.llistaProductes;
    final missatge = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // TODO: Logout
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productes.length, // Number of items in the list
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(productes[index].image),
              Container(
                width: 80,
                height: 80,
                color: Colors.grey, // Placeholder color
              ),
              // Price
              Text('Price: \$20.00'),
              // Buttons (Remove and Add)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Remove action
                    },
                    child: Text('Remove'),
                  ),
                  SizedBox(width: 8), // Add some spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add action
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 16), // Add some spacing between items
            ],
          );
        },
      ),
    );
  }
}
