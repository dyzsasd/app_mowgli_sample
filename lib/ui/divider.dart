import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_colors.dart';

class Separator extends StatelessWidget {
  const Separator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1.0,
      child: ColoredBox(
        color: AppColors.alertsItemDivider,
      ),
    );
  }
}
