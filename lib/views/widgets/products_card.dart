import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  String name;
  double price;
  bool inStock;
  Function() editButton;
  Function()? deleteButton;

  ProductsCard(
      {super.key,
      required this.name,
      required this.price,
      required this.inStock,
      required this.deleteButton,
      required this.editButton});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("$name"),
            const SizedBox(
              height: 10,
            ),
            Text("$price"),
            const SizedBox(
              height: 10,
            ),
            Text("${inStock ? "available" : "not available"}"),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap:editButton,
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                  ),
                ),
                InkWell(
                  onTap: deleteButton,
                  child: const Icon(
                    Icons.delete,
                    size: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
