import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/constants/app_typography.dart';
import 'package:betalent/models/employee.dart';
import 'package:betalent/utils/formatters.dart';
import 'package:betalent/utils/extensions.dart';
import 'package:betalent/widgets/text_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class EmployeeTableRow extends StatefulWidget {
  final Employee employee;
  const EmployeeTableRow(this.employee, {super.key});

  @override
  State<EmployeeTableRow> createState() => _EmployeeTableRowState();
}

class _EmployeeTableRowState extends State<EmployeeTableRow> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _isExpanded = !_isExpanded;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildTitle(),
            if (_isExpanded) _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 18),
        TextRow(
          label: 'Cargo',
          value: widget.employee.job,
        ),
        DottedLine(dashColor: AppColors.gray10),
        const SizedBox(height: 14),
        TextRow(
          label: 'Data de admissão',
          value: widget.employee.admissionDate.formatDMY(),
        ),
        DottedLine(dashColor: AppColors.gray10),
        const SizedBox(height: 14),
        TextRow(
          label: 'Telefone',
          value: Formatters.phone.maskText(widget.employee.phone),
        ),
        DottedLine(dashColor: AppColors.gray10),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 34,
            child: CircleAvatar(
              foregroundImage: NetworkImage(widget.employee.imageUrl),
            ),
          ),
          const SizedBox(width: 24),
          Text(
            widget.employee.name,
            style: AppTypography.h3,
          ),
          Expanded(child: Container()),
          Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppColors.bluePrimary,
            size: 32,
          )
        ],
      ),
    );
  }
}
