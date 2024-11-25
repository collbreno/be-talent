import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formatDMY() => DateFormat('dd/MM/yyyy').format(this);
}
