import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/scaffold.dart';

class LocationPickerBottomButtonContainer extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool visible;
  final bool bottomContainerVisible;

  LocationPickerBottomButtonContainer(
      {@required this.label,
      this.visible = true,
      this.onPressed,
      this.bottomContainerVisible = true})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return ScaffoldBottomButtonContainer(
      label: label,
      onPressed: onPressed,
      visible: visible,
      bottomContainerVisible: bottomContainerVisible,
    );
  }
}
