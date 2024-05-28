import 'package:flutter/material.dart';
import 'package:lesson44_homework/models/product_model.dart';

// ignore: must_be_immutable
class EditDialogBox extends StatefulWidget {
  Product product;
  EditDialogBox({super.key, required this.product});

  @override
  State<EditDialogBox> createState() => _EditDialogBoxState();
}

class _EditDialogBoxState extends State<EditDialogBox> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController inStock = TextEditingController();

  _saveChanges() {
    if (name.text.isNotEmpty &&
        price.text.isNotEmpty &&
        double.tryParse(price.text) != null &&
        (inStock.text == "no" || inStock.text == "yes")) {
      Navigator.pop(
          context,
          Product(
              name: name.text,
              price: double.parse(price.text),
              inStock: inStock.text.toLowerCase() == "yes" ? true : false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      content: Container(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: widget.product.name),
            ),
            TextField(
              controller: price,
              decoration:
                  InputDecoration(hintText: "${widget.product.price}"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: inStock,
              decoration: InputDecoration(
                  hintText: widget.product.inStock == true
                      ? "available"
                      : "not available"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: _saveChanges,
                  child: const Text(
                    "Save changes",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
