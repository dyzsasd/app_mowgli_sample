import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/scaffold.dart';

class FiltersBottomContainer extends StatelessWidget {
  final Widget child;
  final double verticalPadding;

  FiltersBottomContainer({@required this.child, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBottomContainer(
        child: child, verticalPadding: verticalPadding);
  }
}

class FiltersBottomButtonContainer extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool visible;

  FiltersBottomButtonContainer(
      {@required this.label, this.visible = true, this.onPressed})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return ScaffoldBottomButtonContainer(
      label: label,
      onPressed: onPressed,
      visible: visible,
    );
  }
}

class FiltersBottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  FiltersBottomButton({@required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBottomButton(
      label: label,
      onPressed: onPressed,
    );
  }
}
