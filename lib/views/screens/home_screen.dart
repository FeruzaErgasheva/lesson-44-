import 'package:flutter/material.dart';
import 'package:lesson44_homework/views/screens/employees_screen.dart';
import 'package:lesson44_homework/views/screens/products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeesScreen(),
                    ));
              },
              child: Text(
                "Employees",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsScreen(),
                    ));
              },
              child: Text(
                "Products",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Lesson  44 homework"),
        centerTitle: true,
      ),
    );
  }
}
