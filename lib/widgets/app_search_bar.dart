import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const AppSearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onSearch);
  }

  void _onSearch() {
    setState(() {
      widget.onChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearch);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      elevation: const WidgetStatePropertyAll(0),
      hintText: 'Pesquisar',
      leading: const Icon(Icons.search),
      hintStyle: WidgetStatePropertyAll(AppTypography.h3),
      textStyle: WidgetStatePropertyAll(AppTypography.h3),
      trailing: [
        if (_controller.text.isNotEmpty)
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
            },
          ),
      ],
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
