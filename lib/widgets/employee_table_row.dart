import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/constants/app_typography.dart';
import 'package:betalent/models/employee.dart';
import 'package:betalent/utils/formatters.dart';
import 'package:betalent/utils/utils.dart';
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
        _buildContentLine(
          'Cargo',
          widget.employee.job,
        ),
        const SizedBox(height: 14),
        _buildContentLine(
          'Data de admissão',
          widget.employee.admissionDate.formatDMY(),
        ),
        const SizedBox(height: 14),
        _buildContentLine(
          'Telefone',
          Formatters.phone.maskText(widget.employee.phone),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildContentLine(String label, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTypography.h2,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  style: AppTypography.h3,
                ),
              ),
            ),
          ],
        ),
        DottedLine(
          dashColor: AppColors.gray10,
        ),
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
