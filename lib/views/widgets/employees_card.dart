import 'package:flutter/material.dart';

class EmployeesCard extends StatelessWidget {
  String name;
  int age;
  String position;
  List skills;
  EmployeesCard({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("$name"),
            SizedBox(
              height: 5,
            ),
            Text("$age"),
            SizedBox(
              height: 5,
            ),
            Text("$position"),
            SizedBox(
              height: 5,
            ),
            Text(
              "${skills}",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
