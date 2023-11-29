import 'package:flutter/material.dart';
import 'package:plantilla_login_register/models/product.dart';
import 'package:plantilla_login_register/providers/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sumaTotal = 0;
  List<int> productList = [0, 0, 0, 0, 0];
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
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productes.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              buildProductColumn(productes[index], productList, index),
              SizedBox(width: 80),
              buildCartColumn(productes[index], productList, index),
            ],
          );
        },
      ),
    );
  }

  Widget buildProductColumn(Product product, List<int> productList, int index) {
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
        Padding(
          padding: const EdgeInsets.only(left: 46.0),
          child: Text('${product.price}€'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      productList[index] = product.price + productList[index];
                      sumaTotal = sumaTotal + product.price;
                    });
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
                    setState(() {
                      productList[index] = productList[index] - product.price;
                      sumaTotal = sumaTotal - product.price;
                      if(sumaTotal < 0){
                        sumaTotal = 0;
                      }
                      if(productList[index] < 0){
                        productList[index] = 0;
                      }
                    });
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

Widget buildCartColumn(Product product, List<int> productList, int index) {
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
      Padding(
        padding: const EdgeInsets.only(left: 46.0),
        child: Text('${product.price}€'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the partial sum for each product.
              Text('Partial Sum: ${productList[index]}€'),
            ],
          ),
          SizedBox(width: 8),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the total sum.
              Text('Total: ${sumaTotal}€'),
            ],
          ),],),
      SizedBox(height: 16),
    ],
  );
}


}
