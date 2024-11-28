import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formatDMY() => DateFormat('dd/MM/yyyy').format(this);
}

extension StringExt on String {
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());
}
