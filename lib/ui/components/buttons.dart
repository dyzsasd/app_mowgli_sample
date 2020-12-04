import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final AppButtonType type;
  final VoidCallback onPressed;

  AppButton(
      {@required this.label,
      @required this.onPressed,
      this.type = AppButtonType.normal,
      this.icon})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (type == AppButtonType.error) {
      backgroundColor = AppColors.buttonErrorBackground;
    } else if (type == AppButtonType.dark) {
      backgroundColor = AppColors.buttonDarkBackground;
    } else if (type == AppButtonType.normalDark) {
      backgroundColor = AppColors.buttonNormalDarkBackground;
    } else {
      backgroundColor = AppColors.buttonNormalBackground;
    }

    Color contentColor;
    if (type == AppButtonType.dark) {
      contentColor = AppColors.buttonDarkContent;
    } else {
      contentColor = AppColors.buttonContent;
    }

    return AppButtonContainer(
      contentColor: contentColor,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null)
            Padding(
                padding: const EdgeInsetsDirectional.only(end: 15.0),
                child: Icon(icon)),
          Expanded(child: Text(label))
        ],
      ),
    );
  }
}

enum AppButtonType { normal, normalDark, dark, error }

class AppButtonContainer extends StatelessWidget {
  final Widget child;
  final Color contentColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  AppButtonContainer(
      {@required this.child,
      this.backgroundColor,
      this.contentColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(6.0));

    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 0.0,
          maxWidth: double.infinity,
          minHeight: 50.0,
          maxHeight: 50.0),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: AppColors.buttonSplash,
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: backgroundColor ?? AppColors.buttonNormalBackground),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: IconTheme(
              data: IconThemeData(
                  color: contentColor ?? AppColors.buttonContent, size: 20.0),
              child: DefaultTextStyle.merge(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: contentColor ?? AppColors.buttonContent,
                      fontWeight: FontWeight.bold),
                  child: child),
            ),
          ),
        ),
      ),
    );
  }
}
