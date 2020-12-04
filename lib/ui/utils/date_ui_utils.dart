import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:mowgli/utils/num_utils.dart';
import 'package:mowgli/utils/text_utils.dart';

class DateUIUtils {
  const DateUIUtils._();

  static String getDiffDuration(Translations translations, DateTime date) {
    Duration difference = date.diff();

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${translations.genericTimeDurationMinutes}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${translations.genericTimeDurationHours}';
    } else {
      return '${difference.inDays} ${translations.genericTimeDurationDays}';
    }
  }

  static String formatDateTimeDifference(
      Translations translations, DateTimeDifference diff,
      {int digits = 1,
      String separator,
      bool showDaysUnit = true,
      bool showHoursUnit = true,
      bool showMinutesUnit = true}) {
    StringBuffer buffer = StringBuffer();
    bool hasSeparator = TextUtils.isNotEmpty(separator);

    if (diff.days > 0) {
      buffer.write(NumUtils.formatNum(diff.days, digits));
      if (showDaysUnit) {
        buffer.write(translations.genericTimeDurationDays);
      }
    }

    if (hasSeparator && buffer.isNotEmpty) {
      buffer.write(separator);
    }

    buffer.write(NumUtils.formatNum(diff.hours, digits));
    if (showHoursUnit) {
      buffer.write(translations.genericTimeDurationHours);
    }

    if (hasSeparator) {
      buffer.write(separator);
    }

    buffer.write(NumUtils.formatNum(diff.minutes, digits));
    if (showMinutesUnit) {
      buffer.write(translations.genericTimeDurationMinutes);
    }

    return buffer.toString();
  }
}
