import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/components/overlay.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/components/alerts_empty_view.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/item/bloc/alerts_subscriptions_item_bloc.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/filters/filters_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_origin.dart';
import 'package:mowgli/ui/utils/badge_utils.dart';
import 'package:mowgli/ui/utils/dialog_utils.dart';

class AlertsSubscriptionItem extends StatelessWidget {
  final AlertSubscription subscription;

  AlertsSubscriptionItem({@required this.subscription, Key key})
      : assert(subscription != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlertsSubscriptionsItemBloc>(
      create: (_) => AlertsSubscriptionsItemBloc(
          context.bloc<AlertsSubscriptionsBloc>(), subscription),
      child: BlocConsumer<AlertsSubscriptionsItemBloc,
          AlertsSubscriptionsItemState>(
        listenWhen: (_, AlertsSubscriptionsItemState state) => state.hasError,
        listener: (BuildContext context, AlertsSubscriptionsItemState state) {
          onError(
              context,
              state.when((_) => null,
                  initial: (_) => null,
                  loading: (_) => null,
                  error: (_, AlertsSubscriptionsItemStateError error) =>
                      error));
        },
        builder: (BuildContext context, AlertsSubscriptionsItemState state) {
          AlertSubscription subscription = state.subscription;
          ThemeData theme = Theme.of(context);

          return ProgressOverlay(
            showOverlay: state.isLoading,
            child: AppInkWell(
              onTap: () async {
                await Navigator.of(context).pushNamed(AppRoutes.routeDealDetails,
                    arguments: DealDetailsScreenArgs.request(
                        request: state.subscription.rawRequest,
                        departure: RequestOriginUtils.toLocation(
                            state.subscription.rawRequest.origin,
                            state.subscription.fromLabel),
                        arrival: RequestDestinationUtils.toLocation(
                            state.subscription.rawRequest.destination,
                            state.subscription.toLabel)));

                context.bloc<AlertsBloc>().forceReload();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 27.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: _TitleRow(subscription)),
                        _RemoveSubscriptionButton()
                      ],
                    ),
                    const SizedBox(height: 9.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: _BadgesRow(subscription.rawRequest.filters)),
                        _EditSubscriptionButton()
                      ],
                    ),
                    const SizedBox(height: 29.0),
                    DefaultTextStyle.merge(
                        style: TextStyle(color: theme.primaryColorDark),
                        child: _NotificationsCount(
                            subscription.notificationsCount))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onError(BuildContext context, AlertsSubscriptionsItemStateError error) {
    Translations translations = Translations.of(context);

    if (error == AlertsSubscriptionsItemStateError.remove) {
      DialogUtils.showErrorDialog(context,
          title: translations.alertsListManageItemDeleteErrorDialogTitle,
          text: translations.alertsListManageItemDeleteErrorDialogMessage);
    } else if (error == AlertsSubscriptionsItemStateError.edit) {
      DialogUtils.showErrorDialog(context,
          title: translations.alertsListManageItemUpdateErrorDialogTitle,
          text: translations.alertsListManageItemUpdateErrorDialogMessage);
    }
  }
}

class _TitleRow extends StatelessWidget {
  final AlertSubscription subscription;

  _TitleRow(this.subscription);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text('${subscription.fromLabel} - ${subscription.toLabel}',
            style: AppTextStyles.h2Bold),
        Icon(AppIcons.bell, color: Theme.of(context).primaryColor, size: 15.0)
      ],
    );
  }
}

class _BadgesRow extends StatelessWidget {
  final Filters filters;

  _BadgesRow(this.filters);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    List<Badge> badges;

    List<BadgeLabel> datesBadges =
        FilterBadgeUtils.getDatesBadges(translations, filters);
    List<BadgeLabel> budgetBadges =
        FilterBadgeUtils.getBudgetBadges(translations, filters);
    List<BadgeLabel> stopOversBadges =
        FilterBadgeUtils.getStopOversBadges(translations, filters);
    List<BadgeLabel> flightDurationBadges =
        FilterBadgeUtils.getFlightDurationBadges(translations, filters);

    if (datesBadges == null &&
        budgetBadges == null &&
        stopOversBadges == null &&
        flightDurationBadges == null) {
      badges = <Badge>[
        Badge.generic(
            label: BadgeLabel(translations.alertsListManageItemNoFilter))
      ];
    } else {
      badges = <Badge>[
        if (datesBadges != null)
          ...datesBadges
              .map((BadgeLabel label) => Badge.generic(label: label))
              .toList(growable: false),
        if (budgetBadges != null)
          ...budgetBadges
              .map((BadgeLabel label) => Badge.generic(label: label))
              .toList(growable: false),
        if (stopOversBadges != null)
          ...stopOversBadges
              .map((BadgeLabel label) => Badge.generic(label: label))
              .toList(growable: false),
        if (flightDurationBadges != null)
          ...flightDurationBadges
              .map((BadgeLabel label) => Badge.generic(label: label))
              .toList(growable: false),
      ];
    }

    return Wrap(
      spacing: 9.0,
      runSpacing: 9.0,
      children: badges,
    );
  }
}

class _NotificationsCount extends StatelessWidget {
  final int count;

  _NotificationsCount(this.count);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    if (count == 0) {
      return const SizedBox();
    } else if (count == 1) {
      return Text(translations.alertsListManageItemSingleNotification,
          style: AppTextStyles.h3
              .copyWith(color: DefaultTextStyle.of(context).style.color));
    } else {
      return Text(
          translations.alertsListManageItemMultipleNotifications(count: count),
          style: AppTextStyles.h3
              .copyWith(color: DefaultTextStyle.of(context).style.color));
    }
  }
}

class _EditSubscriptionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertsIconButton(
      icon: AppIcons.edit,
      tooltip: Translations.of(context).alertsListManageItemButtonEditTooltip,
      onPressed: () async {
        // ignore: close_sinks
        AlertsSubscriptionsItemBloc bloc =
            context.bloc<AlertsSubscriptionsItemBloc>();
        AlertSubscription subscription = bloc.state.subscription;

        Object res = await Navigator.of(context).pushNamed(
            AppRoutes.routeFilters,
            arguments:
                FiltersScreenArgs(filters: subscription.rawRequest.filters));

        if (res is Filters) {
          bloc.updateFilters(res);
        }
      },
    );
  }
}

class _RemoveSubscriptionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertsIconButton(
      icon: AppIcons.close,
      tooltip: Translations.of(context).alertsListManageItemButtonDeleteTooltip,
      onPressed: () {
        context.bloc<AlertsSubscriptionsItemBloc>().removeSubscription();
      },
    );
  }
}
