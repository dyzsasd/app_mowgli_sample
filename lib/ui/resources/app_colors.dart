import 'package:flutter/painting.dart';

class AppColors {
  const AppColors._();

  /// Main theme colors - DO NOT USE them directly

  static const Color _primary = Color(0xFF00C29A);
  static const Color _primaryDark1 = Color(0xFF08808E);
  static const Color _primaryDark2 = Color(0xFF037F8C);
  static const Color _primaryDark3 = Color(0xFF004242);
  static const Color _lightGray1 = Color(0xFFEFEFEF);
  static const Color _lightGray2 = Color(0xFFB8B8B8);
  static const Color _lightGray3 = Color(0xFFECECEC);

  static const Color _text1 = Color(0xFF2E3334);
  static const Color _text2 = Color(0xFF818483);
  static const Color _text3 = Color(0xFF666464);

  static const Color _orange = Color(0xFFFFAA00);
  static const Color _red = Color(0xFFEE484B);
  static const Color _white = Color(0xFFFFFFFF);

  static const Color _cityCode = _text3;
  static const Color _time = _primaryDark1;

  /// END Theme colors

  static const double splashOpacity = 0.2;

  static Color get primary => _primary;

  static Color get primaryDark => _primaryDark1;

  static Color get primaryDarkAlt => _primaryDark2;

  static Color get text => _text1;

  static Color get text2 => _text2;

  static Color get text3 => _text3;

  static Color get white => _white;

  static Color get walkthroughBackground => _primaryDark3;

  static Color get alertBackground => _lightGray1;

  static Color get alertIconColor => _primary;

  static Color get scaffoldBackground => _white;

  static Color get appBarSubtitle => _text2;

  static Color get appBarText => _text1;

  static Color get appbarDivider => Color(0xFFEBEBEB);

  static Color get appbarBackground => _white;

  static Color get appbarMenuBadge => _white;

  static Color get transparentAppbarBackground => _white;

  static Color get tabBarSelectedItem => _primary;

  static Color get tabBarDefaultItem => _text1;

  static Color get buttonNormalBackground => _primary;

  static Color get buttonNormalDarkBackground => _primaryDark1;

  static Color get buttonDarkBackground => _primaryDark3;

  static Color get buttonErrorBackground => _red;

  static Color get buttonContent => _white;

  static const Color buttonDarkContent = Color(0xFF19C8A4);

  static Color get buttonSplash => _white.withOpacity(splashOpacity);

  static Color get textFieldHint => _lightGray2;

  static Color get textFieldValue => _text1;

  static Color get textFieldBackground => _lightGray1;

  static Color get listItemTitle => _text1;

  static Color get listItemIcon => _primary;

  static Color get listItemText => _text1;

  static Color get listItemSecondaryText => _lightGray2;

  static Color get listItemBubblePrimary => _text1;

  static Color get listItemBubbleSecondary => _text3;

  static Color get itemCityCode => _cityCode;

  static Color get itemTime => _time;

  static Color get priceContainerBackground => _white;

  static const Color priceContainerShadow = Color(0x16000000);

  static Color get priceContainerValue => _text1;

  static Color get priceContainerDate => _text3;

  static Color get priceTypeDeal => _primary;

  static Color get priceTypeAverage => _orange;

  static Color get priceTypeExpensive => _red;

  static Color get locationPickerTitle => _text2;

  static Color get cardBorder => _lightGray3;

  static Color get dealTipPrimary => _primaryDark2;

  static Color get dealTipIcon => _white;

  static Color get alertsItemDivider => _lightGray1;

  static Color get alertsIconButton => _text1;

  static Color get segmentedControlColor => _primaryDark1;

  static Color get segmentedControlSelectedText => _white;

  static Color get segmentedControlDefaultText => _lightGray2;

  static Color get calendarDayUnselected => _lightGray1;

  static const Color calendarDayInRange = Color(0xFF9CCCD2);

  static Color get calendarDayRangeLimit => _primaryDark1;

  static Color get priceCalendarDayUnselectedNoPrice => _lightGray1;

  static Color get priceCalendarDayUnselectedHighPrice => _red;

  static Color get priceCalendarDayUnselectedMediumPrice => _orange;

  static Color get priceCalendarDayUnselectedLowPrice => _primary;

  static Color get notificationItemDate => _lightGray2;

  static Color get alertItemIcon => _text1;

  static Color get dealDetailsScaffoldBackground => Color(0xFFFEFEFE);

  static Color get dealDetailsNotificationsContent => _primaryDark3;

  static Color get dealDetailsNotificationsBackground => _lightGray1;
}
