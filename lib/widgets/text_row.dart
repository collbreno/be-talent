import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String label;
  final String value;
  const TextRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
