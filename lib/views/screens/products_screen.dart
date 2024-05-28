import 'package:flutter/material.dart';
import 'package:lesson44_homework/controllers/products_controller.dart';
import 'package:lesson44_homework/models/product_model.dart';
import 'package:lesson44_homework/views/widgets/edit_showdialog.dart';
import 'package:lesson44_homework/views/widgets/product_add_dialogbox.dart';
import 'package:lesson44_homework/views/widgets/products_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsController productsController = ProductsController();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productInStockController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsController.getProducts();
  }

  void onSave() {
    setState(() {
      if (productNameController.text.isNotEmpty &&
          productPriceController.text.isNotEmpty &&
          double.tryParse(productPriceController.text) != null &&
          (productInStockController.text.toLowerCase() == "yes" ||
              productInStockController.text.toLowerCase() == "no")) {
        productsController.addProduct(
            productNameController.text,
            double.parse(productPriceController.text),
            productInStockController.text.toLowerCase() == "yes"
                ? true
                : false);
      }
    });

    Navigator.of(context).pop();
    productNameController.clear();
    productPriceController.clear();
    productInStockController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ProductDialogBox(
              onSave: onSave,
              productInStockController: productInStockController,
              productNameController: productNameController,
              productPriceController: productPriceController,
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          itemCount: productsController.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, i) {
            return ProductsCard(
              name: productsController.products[i].name,
              price: productsController.products[i].price,
              inStock: productsController.products[i].inStock,
              editButton: () async {
                Product? editedProduct = await showDialog(
                  context: context,
                  builder: (context) => EditDialogBox(
                    product: productsController.products[i],
                  ),
                );
                if (editedProduct != null) {
                  productsController.editProduct(i, editedProduct.name,
                      editedProduct.price, editedProduct.inStock);
                }
                setState(() {});
              },
              deleteButton: () {
                setState(() {
                  productsController.deleteProduct(i);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
