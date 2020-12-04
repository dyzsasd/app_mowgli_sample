import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_colors.dart';

class Badge extends StatelessWidget {
  final BadgeLabel label;
  final Color color;
  final BorderRadius radius;
  final bool upperCase;

  Badge.superDeal({@required this.label, this.color})
      : radius = BorderRadius.all(Radius.circular(20.0)),
        upperCase = true;

  Badge.generic({@required this.label, this.color})
      : radius = BorderRadius.all(Radius.circular(4.0)),
        upperCase = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor, borderRadius: radius),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 5.0),
        child: Text(
          upperCase ? label.value.toUpperCase() : label.value,
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
      ),
    );
  }
}

class BadgeLabel {
  final String value;

  BadgeLabel(this.value);
}
