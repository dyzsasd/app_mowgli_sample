import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_icons.dart';

class MowgliBackButton extends StatelessWidget {
  final String tooltip;
  final Color color;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final double size;

  const MowgliBackButton(
      {this.tooltip, this.color, this.padding, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return SafeArea(
      child: IconButton(
        padding: padding ?? const EdgeInsets.all(8.0),
        iconSize: size ?? 13.0,
        icon: Icon(
          AppIcons.back,
          color: color ?? Theme.of(context).primaryColor,
          size: size ?? 13.0,
        ),
        tooltip: tooltip ?? MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: onPressed ??
            () {
              Navigator.maybePop(context);
            },
      ),
    );
  }
}

class MowgliCloseButton extends StatelessWidget {
  final String tooltip;
  final Color color;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final double size;

  const MowgliCloseButton(
      {this.tooltip, this.color, this.padding, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return SafeArea(
      child: IconButton(
        padding: padding ?? const EdgeInsets.all(8.0),
        iconSize: size ?? 18.0,
        icon: Icon(
          AppIcons.close,
          color: color ?? Theme.of(context).primaryColor,
          size: size ?? 18.0,
        ),
        tooltip: tooltip ?? MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: onPressed ??
            () {
              Navigator.maybePop(context);
            },
      ),
    );
  }
}
