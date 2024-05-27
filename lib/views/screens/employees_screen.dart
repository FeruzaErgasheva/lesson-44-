import 'package:flutter/material.dart';
import 'package:lesson44_homework/controllers/employees_controller.dart';
import 'package:lesson44_homework/views/widgets/employees_card.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final EmployeesController employeesController = EmployeesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeesController.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: employeesController.employees.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return EmployeesCard(
            age: employeesController.employees[index].age,
            name: employeesController.employees[index].name,
            position: employeesController.employees[index].position,
            skills: employeesController.employees[index].skills,
          );
        },
      ),
    );
  }
}
