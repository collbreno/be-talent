import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: const WidgetStatePropertyAll(0),
      hintText: 'Pesquisar',
      leading: const Icon(Icons.search),
      hintStyle: WidgetStatePropertyAll(AppTypography.h3),
      textStyle: WidgetStatePropertyAll(AppTypography.h3),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16),
      ),
    );
    // return TextField();
  }
}
