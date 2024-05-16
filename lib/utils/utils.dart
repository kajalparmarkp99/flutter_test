import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String formatTo(String format) {
    return DateFormat(format).format(this);
  }
}