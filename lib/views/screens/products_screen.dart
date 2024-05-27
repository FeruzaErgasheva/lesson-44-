import 'package:flutter/material.dart';
import 'package:lesson44_homework/controllers/products_controller.dart';
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
    setState(() {});
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
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return ProductsCard(
              name: productsController.products[index].name,
              price: productsController.products[index].price,
              inStock: productsController.products[index].inStock,
            );
          },
        ),
      ),
    );
  }
}
