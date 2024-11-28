import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/models/employee.dart';
import 'package:betalent/widgets/employee_table/employee_table_row.dart';
import 'package:betalent/widgets/employee_table/employee_table_header.dart';
import 'package:flutter/material.dart';

class EmployeeTable extends StatelessWidget {
  final List<Employee> employees;
  const EmployeeTable(this.employees, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          color: AppColors.gray10,
          width: 1,
        )),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const EmployeeTableHeader(),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) => EmployeeTableRow(employees[index]),
            separatorBuilder: (context, index) => Divider(
              color: AppColors.gray10,
              thickness: 1,
              height: 1,
            ),
            itemCount: employees.length,
          ),
        ],
      ),
    );
  }
}
