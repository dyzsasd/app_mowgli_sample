import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_styles.dart';

class AlertsEmpty extends StatelessWidget {
  final String label;

  AlertsEmpty({@required this.label}) : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 43.0, start: 26.0),
      child: Text(label, style: AppTextStyles.h2Bold),
    );
  }
}

class AlertsIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  AlertsIconButton(
      {@required this.icon, @required this.tooltip, this.onPressed})
      : assert(icon != null),
        assert(tooltip != null);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 5.0),
        child: AppInkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 15.0, color: AppColors.alertItemIcon),
          ),
        ),
      ),
    );
  }
}
