import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle style;

  StatusBar({@required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: style ??
            SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white),
        child: child);
  }
}
