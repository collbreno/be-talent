import 'package:betalent/utils/async_data.dart';
import 'package:flutter/material.dart';

class AsyncDataBuilder<T> extends StatelessWidget {
  final AsyncData<T> state;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget Function(BuildContext context)? nothingBuilder;

  const AsyncDataBuilder({
    super.key,
    required this.state,
    required this.builder,
    this.loadingBuilder,
    this.nothingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return loadingBuilder != null
          ? loadingBuilder!(context)
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
    } else if (state.hasError) {
      return _buildError(state.error!);
    } else if (state.hasData) {
      // ignore: null_check_on_nullable_type_parameter
      return builder(context, state.data!);
    } else {
      if (nothingBuilder != null) {
        return nothingBuilder!(context);
      } else {
        throw AssertionError('Cubit did not started loading');
      }
    }
  }

  Widget _buildError(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning),
            const SizedBox(height: 16),
            Text(error.toString()),
          ],
        ),
      ),
    );
  }
}
