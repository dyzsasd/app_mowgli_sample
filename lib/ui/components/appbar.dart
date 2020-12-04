import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/utils/text_utils.dart';

class MowgliAppBar extends AppBar {
  MowgliAppBar(
      {@required BuildContext context,
      Widget title,
      Widget leading,
      PreferredSizeWidget bottom,
      List<Widget> actions,
      bool bottomLineBorder = true})
      : super(
            leading: leading ?? const MowgliBackButton(),
            title: title,
            backgroundColor: AppColors.appbarBackground,
            shape: bottomLineBorder ? _BottomLineBorder() : null,
            elevation: 0.0,
            actions: actions,
            bottom: bottom,
            centerTitle: true,
            actionsIconTheme: IconThemeData(
                color: Theme.of(context).primaryColor, size: 20.0));
}

class _BottomLineBorder extends ContinuousRectangleBorder {
  final Paint _paint;

  _BottomLineBorder() : _paint = Paint()..color = AppColors.appbarDivider;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    super.paint(canvas, rect);
    canvas.drawLine(Offset(0, rect.bottom - 1.0),
        Offset(rect.width, rect.bottom - 1.0), _paint);
  }
}

class TransparentAppBar extends AppBar {
  TransparentAppBar(
      {@required BuildContext context,
      Widget title,
      Widget leading,
      Widget bottom,
      List<Widget> actions})
      : super(
            leading: leading ?? const MowgliBackButton(),
            title: title,
            backgroundColor: AppColors.transparentAppbarBackground,
            elevation: 0.0,
            actions: actions,
            bottom: bottom,
            actionsIconTheme: IconThemeData(
                color: Theme.of(context).primaryColor, size: 20.0));
}

class AppBarSearchContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String value;
  final String hint;

  AppBarSearchContainer({this.value, this.hint, this.onPressed});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(4.0);
    return AppInkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.textFieldBackground,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
        child: Center(
          child: Text(
            value ?? hint,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
                fontSize: 16.0,
                color: value != null
                    ? AppColors.textFieldValue
                    : AppColors.textFieldHint),
          ),
        ),
      ),
    );
  }
}

class AppBarTextMenu extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  AppBarTextMenu({@required this.label, this.onPressed})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            label,
            style: AppTextStyles.h4Bold
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}

class AppBarIconWithBadge extends StatelessWidget {
  final String badge;
  final IconData icon;
  final VoidCallback onPressed;
  final Offset translation;
  final double sizeIcon;
  final double sizeBadge;
  final double badgeTopPosition;
  final double right;

  AppBarIconWithBadge(
      {@required this.icon,
      @required this.onPressed,
      this.badge,
      this.translation,
      this.sizeIcon,
      this.sizeBadge,
      this.badgeTopPosition,
      this.right});

  AppBarIconWithBadge.fixed(
      {@required IconData icon, @required VoidCallback onPressed, String badge})
      : this(
            icon: icon,
            onPressed: onPressed,
            badge: badge,
            translation: Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: translation ?? (badge != null ? Offset(-5.0, 5.0) : Offset.zero),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AppInkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 45.0,
              height: 45.0,
              child: Center(
                child: Icon(
                  icon,
                  size: sizeIcon ?? 26.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          if (TextUtils.isNotEmpty(badge))
            Positioned(
                top: badgeTopPosition ?? 0.0,
                right: right ?? 0.0,
                child: Container(
                    width: sizeBadge ?? 23.0,
                    height: sizeBadge ?? 23.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColorDark),
                    alignment: Alignment.center,
                    child: Text(
                      badge,
                      maxLines: 1,
                      style: AppTextStyles.h4Medium
                          .copyWith(color: AppColors.appbarMenuBadge),
                    )))
        ],
      ),
    );
  }
}

class AppBarFiltersButton extends StatelessWidget {
  final Filters filters;
  final VoidCallback onPressed;
  final Offset translation;

  AppBarFiltersButton({this.filters, this.onPressed, this.translation});

  AppBarFiltersButton.fixed({this.filters, this.onPressed})
      : translation = Offset.zero;

  @override
  Widget build(BuildContext context) {
    int filtersQty = filters?.quantity ?? 0;

    return AppBarIconWithBadge(
      icon: AppIcons.settings,
      badge: filtersQty > 0 ? filtersQty.toString() : null,
      onPressed: onPressed,
      translation: translation,
    );
  }
}
