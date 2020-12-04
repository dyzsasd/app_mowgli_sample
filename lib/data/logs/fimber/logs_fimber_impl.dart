import 'package:flutter/foundation.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:mowgli/data/logs/logs_interface.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';

class LogsFimberImpl extends LogsService {
  LogsFimberImpl(Iterable<LogTree> trees) {
    if (IterableUtils.isNotEmpty(trees)) {
      for (LogTree tree in trees) {
        Fimber.plantTree(tree);
      }
    }
  }

  @override
  Future<void> init() async {
    // Nothing
  }

  @override
  void debug(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace}) {
    Fimber.d(_getMessage(tag, message), ex: error, stacktrace: stackTrace);
  }

  @override
  void error(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace}) {
    Fimber.e(_getMessage(tag, message), ex: error, stacktrace: stackTrace);
  }

  @override
  void info(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace}) {
    Fimber.i(_getMessage(tag, message), ex: error, stacktrace: stackTrace);
  }

  @override
  void warning(
      {@required String tag,
      String message,
      Object error,
      StackTrace stackTrace}) {
    Fimber.w(_getMessage(tag, message), ex: error, stacktrace: stackTrace);
  }

  String _getMessage(String tag, String message) {
    StringBuffer buffer = StringBuffer();

    if (tag != null) {
      buffer.write('[$tag]: ');
    }

    if (message != null) {
      buffer.write(message);
    }

    return buffer.toString();
  }
}
