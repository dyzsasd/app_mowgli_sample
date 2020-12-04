import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextField extends PlatformWidget<CupertinoTextField, TextField> {
  @override
  final Key key;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final TextInputType keyboardType;
  final TextStyle style;
  final bool obscureText;
  final bool autocorrect;
  final Color cursorColor;
  final TextAlign textAlign;

  PlatformTextField(
      {this.key,
      this.controller,
      this.focusNode,
      this.decoration,
      this.padding,
      this.placeholder,
      this.keyboardType,
      this.style,
      this.obscureText = false,
      this.cursorColor,
      this.autocorrect = false,
      this.textAlign = TextAlign.start});

  @override
  TextField createMaterialWidget(BuildContext context) {
    return TextField(
        key: key,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintText: placeholder),
        textAlign: textAlign,
        keyboardType: keyboardType,
        style: style,
        autocorrect: autocorrect,
        cursorColor: cursorColor,
        obscureText: obscureText);
  }

  @override
  CupertinoTextField createCupertinoWidget(BuildContext context) {
    return CupertinoTextField(
        key: key,
        controller: controller,
        textAlign: textAlign,
        focusNode: focusNode,
        decoration: decoration,
        padding: padding ?? const EdgeInsets.all(6.0),
        placeholder: placeholder,
        keyboardType: keyboardType,
        style: style,
        autocorrect: autocorrect,
        cursorColor: cursorColor,
        obscureText: obscureText);
  }
}

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final Widget child;
  final PreferredSizeWidget appBar;
  final Color backgroundColor;

  const PlatformScaffold({this.child, this.appBar, this.backgroundColor});

  @override
  Scaffold createMaterialWidget(BuildContext context) {
    return Scaffold(
        body: child, appBar: appBar, backgroundColor: backgroundColor);
  }

  @override
  CupertinoPageScaffold createCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
        child: child, navigationBar: appBar, backgroundColor: backgroundColor);
  }
}

class PlatformButton extends PlatformWidget<CupertinoButton, FlatButton> {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final bool shrinkWrap;

  PlatformButton(
      {this.child, this.padding, this.onPressed, this.shrinkWrap = false});

  @override
  FlatButton createMaterialWidget(BuildContext context) {
    return FlatButton(
        child: child,
        padding: padding,
        onPressed: onPressed,
        materialTapTargetSize:
            shrinkWrap ? MaterialTapTargetSize.shrinkWrap : null,
        shape: RoundedRectangleBorder());
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
        minSize: 0.0, padding: padding, child: child, onPressed: onPressed);
  }
}

class PlatformProgressBar extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  const PlatformProgressBar();

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) =>
      const CircularProgressIndicator();

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) =>
      const CupertinoActivityIndicator();
}

class PlatformAlertDialog<T>
    extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final Widget title;
  final Widget text;
  final Iterable<PlatformAlertDialogAction<T>> actions;

  PlatformAlertDialog({this.title, this.text, this.actions});

  @override
  AlertDialog createMaterialWidget(BuildContext context) {
    return AlertDialog(
        title: DefaultTextStyle.merge(
            style: const TextStyle(fontWeight: FontWeight.bold), child: title),
        content: DefaultTextStyle.merge(
            style: const TextStyle(height: 1.3), child: text),
        actions: actions?.map((PlatformAlertDialogAction<T> action) {
          return FlatButton(
            textColor: Theme.of(context).primaryColorDark,
            onPressed: () async {
              if (action.onPressed != null) {
                Navigator.of(context).maybePop(await action.onPressed(context));
              } else {
                Navigator.of(context).maybePop();
              }
            },
            child: Text(action.title.toUpperCase()),
          );
        })?.toList(growable: false));
  }

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
        title: title,
        content: text,
        actions: actions.map((PlatformAlertDialogAction<T> action) {
          return CupertinoDialogAction(
            onPressed: () async {
              if (action.onPressed != null) {
                Navigator.of(context).maybePop(await action.onPressed(context));
              } else {
                Navigator.of(context).maybePop();
              }
            },
            isDestructiveAction: action.isDestructive ?? false,
            isDefaultAction: action.isDefault ?? false,
            child: Text(action.title),
          );
        }).toList(growable: false));
  }
}

typedef PlatformAlertDialogActionEvent<T> = Future<T> Function(
    BuildContext context);

class PlatformAlertDialogAction<T> {
  final String title;
  final PlatformAlertDialogActionEvent<T> onPressed;
  final bool isDefault;
  final bool isDestructive;

  const PlatformAlertDialogAction(
      {@required this.title,
      this.onPressed,
      this.isDefault,
      this.isDestructive = false})
      : assert(title != null);

  @override
  String toString() {
    return 'PlatformAlertDialogAction{title: $title, onPressed: $onPressed, isDefault: $isDefault, isDestructive: $isDestructive}';
  }
}

Future<dynamic> openPlatformDialog(BuildContext context, Widget content) {
  WidgetBuilder builder = (BuildContext context) {
    return content;
  };

  if (Platform.isIOS) {
    return showCupertinoDialog(context: context, builder: builder);
  } else {
    return showDialog(context: context, builder: builder);
  }
}

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidget();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return createCupertinoWidget(context);
    } else {
      return createMaterialWidget(context);
    }
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);
}
