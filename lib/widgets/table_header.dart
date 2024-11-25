import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.blue10,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Text('FOTO', style: AppTypography.h2),
          const SizedBox(width: 24),
          Text('NOME', style: AppTypography.h2),
          const SizedBox(width: 24),
          Expanded(
            child: Container(),
          ),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }
}
