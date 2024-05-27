import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  String name;
  double price;
  bool inStock;
  ProductsCard(
      {super.key,
      required this.name,
      required this.price,
      required this.inStock});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("$name"),
            SizedBox(
              height: 10,
            ),
            Text("$price"),
            SizedBox(
              height: 10,
            ),
            Text("${inStock ? "available" : "not available"}")
          ],
        ),
      ),
    );
  }
}
