import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/models/employee.dart';
import 'package:betalent/widgets/employee_tile.dart';
import 'package:betalent/widgets/table_header.dart';
import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<Employee> employees;
  const AppTable(this.employees, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          color: AppColors.gray10,
          width: 1,
        )),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          TableHeader(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => EmployeeTile(employees[index]),
              separatorBuilder: (context, index) => Divider(
                color: AppColors.gray10,
                thickness: 1,
                height: 1,
              ),
              itemCount: employees.length,
            ),
          ),
        ],
      ),
    );
  }
}
