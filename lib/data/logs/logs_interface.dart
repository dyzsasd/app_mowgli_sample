import 'package:flutter/foundation.dart';

abstract class LogsService {
  Future<void> init();

  void debug(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace});

  void error(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace});

  void info(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace});

  void warning(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace});
}
