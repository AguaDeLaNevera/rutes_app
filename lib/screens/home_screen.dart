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

    return Scaffold(
      appBar: AppBar(
        title: Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productes.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              buildProductColumn(productes[index], info),
              SizedBox(width: 80), // Add some spacing between columns
              buildCartColumn(productes[index]),
            ],
          );
        },
      ),
    );
  }

  Widget buildProductColumn(Product product, Information info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.network(
            product.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 46.0), child: Text('${product.price}€')),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    info.cartProvider.addToCart(product.price);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(4),
                  ),
                  child: Icon(Icons.add, size: 12),
                ),
                SizedBox(height: 4),
              ],
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    info.cartProvider.removeFromCart(product.price);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(4),
                  ),
                  child: Icon(Icons.remove, size: 12),
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildCartColumn(Product product) {
    return Consumer<Information>(
      builder: (context, info, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
            product.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
            Text('${info.cartProvider.sumaTotal}€'),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
