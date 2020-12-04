import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NumUtils {
  const NumUtils._();

  static double parseDouble(dynamic value,
      [double defaultValue, bool acceptNullValueDefaultValue = false]) {
    if (value is double) {
      return value;
    } else if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? defaultValue;
    } else if (value is TextEditingValue) {
      return parseDouble(value.text);
    } else if (defaultValue != null || acceptNullValueDefaultValue == true) {
      return defaultValue;
    } else {
      throw Exception('Not a double !');
    }
  }

  static int parseInt(dynamic value,
      [int defaultValue, bool acceptNullValueDefaultValue = false]) {
    if (value is int) {
      return value;
    } else if (value is num) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    } else if (value is TextEditingValue) {
      return parseInt(value.text);
    } else if (defaultValue != null || acceptNullValueDefaultValue == true) {
      return defaultValue;
    } else {
      throw Exception('Not an int !');
    }
  }

  static num parseNum(dynamic value,
      [num defaultValue, bool acceptNullValueDefaultValue = false]) {
    if (value is num) {
      return value;
    } else if (value is String) {
      return num.tryParse(value) ?? defaultValue;
    } else if (defaultValue != null || acceptNullValueDefaultValue == true) {
      return defaultValue;
    } else {
      throw Exception('Not a num !');
    }
  }

  static String toFormattedString(num num, [int digits = 0]) {
    if (num == null) {
      return '';
    }

    if (num is double && digits == 0) {
      return NumberFormat.decimalPattern('fr').format(num);
    } else {
      if (digits == 0) {
        return num.toString();
      } else {
        return NumberFormat(
                '####.${List<String>.filled(digits ?? 3, '0').join()}', 'fr')
            .format(num);
      }
    }
  }

  /// Add leading zeros to a number
  static String formatNum(int num, int digits) {
    String text = num?.toString() ?? '';
    return text.padLeft(digits, '0');
  }
}
