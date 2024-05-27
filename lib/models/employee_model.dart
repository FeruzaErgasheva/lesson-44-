import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class Employee {
  String name;
  int age;
  String position;
  List skills;

  Employee(
      {required this.name,
      required this.age,
      required this.position,
      required this.skills});

  factory Employee.fromJson(dynamic json){
    return _$EmployeeFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$EmployeeToJson(this);
  }

}
