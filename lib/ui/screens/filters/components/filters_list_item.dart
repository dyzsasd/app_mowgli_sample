import 'package:flutter/material.dart' hide Switch, Slider;
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/slider.dart';
import 'package:mowgli/ui/components/switch.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';

const double kFilterListCheckableItemHeight = 60.0;
const double kFilterListSliderItemHeight = 141.0;

class FilterListItem extends StatelessWidget {
  final String label;
  final List<BadgeLabel> badges;
  final VoidCallback onPressed;

  FilterListItem({@required this.label, this.badges, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListItemCell(
      label: label,
      badges: badges,
      onPressed: onPressed,
      icon: AppIcons.arrowRight,
    );
  }
}

class FilterListCheckableItem extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  FilterListCheckableItem(
      {@required this.label, @required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 60.0, minWidth: double.infinity),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(
            horizontal: kListItemCellHorizontalPadding, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(label,
                  style:
                      value == true ? AppTextStyles.h2Bold : AppTextStyles.h2),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Switch(value: value),
            )
          ],
        ),
      ),
    );
  }
}

class FilterListSliderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int divisions;
  final num minValue;
  final num maxValue;
  final num currentMinValue;
  final num currentMaxValue;
  final ValueChanged<num> onMinChanged;
  final ValueChanged<num> onMaxChanged;

  FilterListSliderItem({
    @required this.title,
    @required this.subtitle,
    @required this.maxValue,
    @required this.currentMaxValue,
    @required this.onMinChanged,
    @required this.onMaxChanged,
    this.divisions,
    this.minValue,
    this.currentMinValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 141.0, minWidth: double.infinity),
      padding: const EdgeInsets.symmetric(
          horizontal: kListItemCellHorizontalPadding, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: AppTextStyles.h2Medium),
          const SizedBox(height: 2.0),
          Text(subtitle, style: AppTextStyles.h3),
          const SizedBox(height: 2.0),
          EasySlider(
              divisions: divisions,
              minValue: minValue,
              maxValue: maxValue,
              currentMinValue: currentMinValue,
              currentMaxValue: currentMaxValue,
              onMinChanged: onMinChanged,
              onMaxChanged: onMaxChanged),
        ],
      ),
    );
  }
}
