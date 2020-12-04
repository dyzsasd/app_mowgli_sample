import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/screens/alerts/alerts_screen.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/alert_editor_screen.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/destination_viewer/destination_viewer_screen.dart';
import 'package:mowgli/ui/screens/filters/filters_screen.dart';
import 'package:mowgli/ui/screens/homepage/homepage_screen.dart';
import 'package:mowgli/ui/screens/pickers/location/destination_picker_screen.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/pickers/location/origin_picker_screen.dart';
import 'package:mowgli/ui/screens/price_calendar/price_calendar_screen.dart';
import 'package:mowgli/ui/screens/section_details/section_details_screen.dart';
import 'package:mowgli/ui/screens/walkthrough/walkthough_screen.dart';
import 'package:mowgli/ui/utils/routes.dart';
import 'package:mowgli/utils/platform_utils.dart';

const String _kLogTag = 'AppRoutes';

class AppRoutes {
  static const String routeHome = '/';
  static const String routeSectionDetails = '/section';
  static const String routeDealDetails = '/deal';
  static const String routeAlertCreator = '/deal/alert_creator';
  static const String routeDestinationDetails = '/destination';
  static const String routeOriginPicker = '/search_origin';
  static const String routeDestinationPicker = '/search_destination';
  static const String routeAlertsViewer = '/alerts';
  static const String routeFilters = '/filters';
  static const String routePriceCalendar = '/calendar';
  static const String routeWalkthrough = '/init';

  const AppRoutes._();

  static Route<dynamic> getRoutes(RouteSettings settings) {
    WidgetBuilder builder;
    _PageAnimation animation = _PageAnimation.horizontal;

    String routeName = _rewriteRoute(settings);

    switch (routeName) {
      case routeHome:
        builder = (BuildContext context) => HomePageScreen();
        animation = _PageAnimation.horizontal;
        break;
      case routeWalkthrough:
        builder = (BuildContext context) => WalkthroughScreen();
        animation = _PageAnimation.horizontal;
        break;
      case routeAlertsViewer:
        builder = (BuildContext context) => AlertsScreen();
        animation = _PageAnimation.horizontal;
        break;
      case routeAlertCreator:
        builder = (BuildContext context) => DealDetailsAlertEditorScreen(
            settings.arguments as DealDetailsAlertEditorScreenArgs);
        animation = _PageAnimation.vertical;
        break;
      case routeFilters:
        builder = (BuildContext context) =>
            FiltersScreen(settings.arguments as FiltersScreenArgs);
        animation = _PageAnimation.vertical;
        break;
      case routeSectionDetails:
        builder = (BuildContext context) => SectionDetailsScreen(
            settings.arguments as SectionDetailsScreenArgs);
        animation = _PageAnimation.horizontal;
        break;
      case routeDestinationDetails:
        builder = (BuildContext context) => DestinationViewerScreen(
            settings.arguments as DestinationViewerScreenArgs);
        animation = _PageAnimation.horizontal;
        break;
      case routeDealDetails:
        builder = (BuildContext context) =>
            DealDetailsScreen(settings.arguments as DealDetailsScreenArgs);
        animation = _PageAnimation.horizontal;
        break;
      case routePriceCalendar:
        builder = (BuildContext context) =>
            PriceCalendarScreen(settings.arguments as PriceCalendarScreenArgs);
        animation = _PageAnimation.vertical;
        break;
      case routeOriginPicker:
        builder = (BuildContext context) =>
            OriginPickerScreen(settings.arguments as LocationPickerScreenArgs);
        animation = _PageAnimation.vertical;
        break;
      case routeDestinationPicker:
        builder = (BuildContext context) => DestinationPickerScreen(
            settings.arguments as LocationPickerScreenArgs);
        animation = _PageAnimation.vertical;
        break;
    }

    if (builder == null) {
      ApplicationServices.logs
          .error(tag: _kLogTag, message: 'On unknown route $routeName');
      builder = (BuildContext context) => HomePageScreen();
    }

    if (animation == _PageAnimation.horizontal) {
      return _HorizontalRoute<dynamic>(builder: builder, settings: settings);
    } else {
      return _VerticalRoute<dynamic>(builder: builder, settings: settings);
    }
  }

  static String _rewriteRoute(RouteSettings settings) {
    /// Enforce the walkthrough the first time the app is launched
    if (settings.name == routeHome &&
        ApplicationServices.session.isUserConnected() != true) {
      return routeWalkthrough;
    }

    return settings.name;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    ApplicationServices.logs
        .debug(tag: _kLogTag, message: 'On unknown route ${settings.name}');

    return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => HomePageScreen(),
        settings: settings);
  }
}

/// Default "slide from bottom" animation on both platforms
class _VerticalRoute<T> extends MaterialPageRoute<T> {
  _VerticalRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings, fullscreenDialog: true);
}

/// Default slide animations on iOS and zoom on Android
class _HorizontalRoute<T> extends MaterialPageRoute<T> {
  _HorizontalRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings, fullscreenDialog: false);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (PlatformUtils.isIOS) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    } else {
      return ZoomPageTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
    }
  }
}

enum _PageAnimation {
  // Screens with a close button
  vertical,
  // Screens with a back button
  horizontal
}
