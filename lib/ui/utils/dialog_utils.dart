import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/utils/platform_widget.dart';

class DialogUtils {
  const DialogUtils._();

  static Future<T> showErrorDialog<T>(BuildContext context,
      {@required String text,
      String title,
      PlatformAlertDialogAction<T> positiveAction,
      PlatformAlertDialogAction<T> negativeAction}) {
    assert(text != null);
    return showDialog<T>(
        context: context,
        builder: (BuildContext context) {
          Translations translations = Translations.of(context);
          return PlatformAlertDialog<T>(
            title: Text(title ?? translations.genericDialogErrorTitle),
            text: Text(text),
            actions: <PlatformAlertDialogAction<T>>[
              if (negativeAction != null) negativeAction,
              positiveAction ?? _defaultPositiveAction<T>(context)
            ],
          );
        });
  }

  static PlatformAlertDialogAction<T> _defaultPositiveAction<T>(
      BuildContext context) {
    return PlatformAlertDialogAction<T>(
        title: Translations.of(context).genericDialogPositiveLabel);
  }
}
