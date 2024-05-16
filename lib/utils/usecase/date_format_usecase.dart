import 'package:intl/intl.dart';

class DateFormatUseCase {
  String formatDateTime(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }
}