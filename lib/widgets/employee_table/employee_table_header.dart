import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';

class EmployeeTableHeader extends StatelessWidget {
  const EmployeeTableHeader({super.key});

  static const _dotSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.blue10,
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Text('FOTO', style: AppTypography.h2),
          const SizedBox(width: 24),
          Text('NOME', style: AppTypography.h2),
          const SizedBox(width: 24),
          Expanded(
            child: Container(),
          ),
          Container(
            height: _dotSize,
            width: _dotSize,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(_dotSize),
            ),
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }
}
