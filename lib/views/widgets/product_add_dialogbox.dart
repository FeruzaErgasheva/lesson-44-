// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lesson44_homework/controllers/products_controller.dart';

class ProductDialogBox extends StatefulWidget {
  Function()? onSave;
  TextEditingController productNameController ;
  TextEditingController productPriceController;
  TextEditingController productInStockController;
  ProductDialogBox({super.key, required this.onSave,required this.productInStockController,required this.productNameController,required this.productPriceController});

  @override
  State<ProductDialogBox> createState() => _ProductDialogBoxState();
}

class _ProductDialogBoxState extends State<ProductDialogBox> {

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "New Product",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(hintText: "product name"),
              controller: widget.productNameController,
            ),
            TextField(
              controller: widget.productPriceController,
              decoration: InputDecoration(hintText: "product price"),
            ),
            TextField(
              controller: widget.productInStockController,
              decoration: InputDecoration(hintText: "Available?:no/yes"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.deepPurple),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: widget.onSave,
                    child: const Text("Save")),
                TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.deepPurple),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
