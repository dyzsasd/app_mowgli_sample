import 'package:mowgli/utils/date_utils.dart';

class JSONParserUtils {
  static DateTime parseDateTime(Object date) {
    if (date is String) {
      return DateTime.parse(date);
    }

    return null;
  }

  static DateTime parseDate(Object date) {
    if (date is String) {
      return DateTime.parse('$date 00:00:00');
    }

    return null;
  }

  static DateTime parseTimestamp(Object date) {
    if (date is num) {
      return DateTime.fromMillisecondsSinceEpoch(date * 1000);
    }

    return null;
  }

  static String formatDate(DateTime date) {
    return date?.formatDate(format: 'yyyy-MM-dd');
  }

  static String formatTime(DateTime date) {
    return date?.formatDate(format: 'HH:mm');
  }
}
