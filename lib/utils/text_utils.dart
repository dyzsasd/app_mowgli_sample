import 'dart:math' as math;

import 'package:mowgli/utils/num_utils.dart';

class TextUtils {
  const TextUtils._();

  static String parseString(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }

  static bool isEmpty(String text) {
    if (text == null) {
      return true;
    } else {
      return text.isEmpty;
    }
  }

  static bool isNotEmpty(String text) {
    if (text == null) {
      return false;
    } else {
      return text.isNotEmpty;
    }
  }

  static String toFirstLettersUpperCase(String text) {
    if (text != null) {
      if (text.length <= 1) {
        return text.toUpperCase();
      } else {
        return text[0].toUpperCase() + text.substring(1);
      }
    }
    return null;
  }
}

extension TextExtensions on String {
  double toDouble() => NumUtils.parseDouble(this);

  int toInt() => NumUtils.parseInt(this);

  num toNum() => NumUtils.parseNum(this);

  String safeSubstring(int start, int end) =>
      substring(start, math.min(length, end));

  String get toFirstLettersUpperCase => TextUtils.toFirstLettersUpperCase(this);
}
