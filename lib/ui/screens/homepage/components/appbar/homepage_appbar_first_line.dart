import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/alerts_screen.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_history_bloc.dart';
import 'package:mowgli/ui/screens/alerts/history/model/alerts_history_data_content.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/utils/text_ui_utils.dart';
import 'package:mowgli/utils/platform_utils.dart';

class HomePageAppBarFirstLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const _AppBarUserIcon(),
        const SizedBox(width: 16.0),
        Expanded(child: _AppBarCurrentDestination()),
        _AppBarAlertsIcon()
      ],
    );
  }
}

class _AppBarUserIcon extends StatelessWidget {
  const _AppBarUserIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        AppIcons.iconApp,
        color: Theme.of(context).primaryColor,
        size: 35.0,
      ),
    );
  }
}

class _AppBarCurrentDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      buildWhen: (_, HomePageState state) => state.when((_) => true,
          loading: (HomePageLocation location) => location != null,
          error: (HomePageLocation location) => location != null,
          empty: (HomePageLocation location) => location != null),
      builder: (BuildContext context, HomePageState state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(Translations.of(context).homePageScreenTitle,
                  style: TextStyle(
                      fontSize: 15.0,
                      height: 1.14,
                      color: AppColors.appBarSubtitle)),
            ),
            _AppBarCurrentLocation(
                location: state.when((HomePageContent data) => data.location,
                    loading: (HomePageLocation location) => location,
                    error: (HomePageLocation location) => location,
                    empty: (HomePageLocation location) => location))
          ],
        );
      },
    );
  }
}

class _AppBarCurrentLocation extends StatelessWidget {
  final HomePageLocation location;

  _AppBarCurrentLocation({@required this.location});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      onTap: location != null
          ? () async {
              Object res = await Navigator.of(context).pushNamed(
                  AppRoutes.routeOriginPicker,
                  arguments: LocationPickerScreenArgs.from(Location(
                      type: LocationType.city,
                      code: location.code,
                      label: location.label,
                      direction: LocationDirection.from,
                      airports: location.airports?.map(
                          (HomePageLocation airport) => Location(
                              code: airport.code, label: airport.label)))));

              if (res is Location) {
                context.bloc<HomePageBloc>().changeLocationTo(res);
              }
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Text(
                  TextUIUtils.addSuffix(
                          location?.label, location?.airports != null) ??
                      location?.code ??
                      Translations.of(context).homePageAppBarDefaultLocation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 23.0, fontWeight: FontWeight.bold)),
            ),
            if (location != null) ...<Widget>[
              const SizedBox(width: 24.0),
              const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  AppIcons.arrowRight,
                  size: 16.0,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _AppBarAlertsIcon extends StatefulWidget {
  @override
  _AppBarAlertsIconState createState() => _AppBarAlertsIconState();
}

class _AppBarAlertsIconState extends State<_AppBarAlertsIcon>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        BlocProvider.of<AlertsHistoryBloc>(context).reloadHistory();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child() {
      return SizedBox(
        width: 40.0,
        height: 40.0,
        child: Center(
            child: Icon(
          AppIcons.bell,
          size: 20.0,
          color: Theme.of(context).primaryColor,
        )),
      );
    }

    return BlocBuilder<AlertsHistoryBloc, AlertsHistoryState>(
        builder: (BuildContext context, AlertsHistoryState state) {
      int notificationsQty = state.maybeWhen(
          (AlertsHistoryContent notifications) =>
              BlocProvider.of<AlertsHistoryBloc>(context).notificationsQty,
          orElse: () => 0);
      return SizedBox(
          width: 40.0,
          height: 45.0,
          child: Transform.translate(
              offset: Offset.zero,
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Positioned(
                    top: 5.0,
                    right: 0.0,
                    child: PlatformUtils.isIOS
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.routeAlertsViewer);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.alertBackground),
                              child: child(),
                            ),
                          )
                        : OpenContainer(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            openBuilder: (BuildContext context, _) {
                              return AlertsScreen();
                            },
                            closedElevation: 0.0,
                            closedShape: const CircleBorder(),
                            closedColor: AppColors.alertBackground,
                            closedBuilder: (BuildContext context, _) {
                              return child();
                            },
                          )),
                if (notificationsQty > 0)
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Container(
                          width: 22.0,
                          height: 22.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColorDark),
                          alignment: Alignment.center,
                          child: Text(
                            notificationsQty.toString(),
                            maxLines: 1,
                            style: AppTextStyles.h4Medium
                                .copyWith(color: AppColors.appbarMenuBadge),
                          ))),
              ])));
    });
  }
}
