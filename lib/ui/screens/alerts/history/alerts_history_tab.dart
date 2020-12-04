import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/components/alerts_empty_view.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_history_bloc.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';
import 'package:mowgli/ui/screens/alerts/history/model/alerts_history_data_content.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/utils/date_ui_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

class AlertsHistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsHistoryBloc, AlertsHistoryState>(
        builder: (BuildContext context, AlertsHistoryState state) {
      return state.when((AlertsHistoryContent notifications) {
        if (notifications.isEmpty) {
          return const _AlertsHistoryEmpty();
        } else {
          BlocProvider.of<AlertsHistoryBloc>(context).clearNotificationQty();
          return _AlertsHistoryList(notifications: notifications.notifications);
        }
      },
          loading: () => const _AlertsHistoryLoading(),
          error: () => const _AlertsHistoryError());
    });
  }
}

class _AlertsHistoryLoading extends StatelessWidget {
  const _AlertsHistoryLoading();

  @override
  Widget build(BuildContext context) {
    return const LoadingList();
  }
}

class _AlertsHistoryError extends StatelessWidget {
  const _AlertsHistoryError();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return ErrorList<AlertsHistoryBloc>(
      errorLabel: translations.alertsListNotificationsErrorMessage,
      retryLabel: translations.alertsListNotificationsErrorButton,
      retryCallback: () {
        context.bloc<AlertsHistoryBloc>().reloadHistory();
      },
    );
  }
}

class _AlertsHistoryEmpty extends StatelessWidget {
  const _AlertsHistoryEmpty();

  @override
  Widget build(BuildContext context) {
    return AlertsEmpty(
        label: Translations.of(context).alertsListNotificationsEmpty);
  }
}

class _AlertsHistoryList extends StatelessWidget {
  final Iterable<NotificationItem> notifications;

  _AlertsHistoryList({@required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: notifications?.length ?? 0,
        separatorBuilder: (BuildContext context, int position) {
          return const Separator();
        },
        itemBuilder: (BuildContext context, int position) {
          NotificationItem notification = notifications.elementAt(position);
          return _AlertsHistoryListItem(notification);
        });
  }
}

class _AlertsHistoryListItem extends StatelessWidget {
  final NotificationItem notification;

  _AlertsHistoryListItem(this.notification) : super(key: Key(notification.id));

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return AppInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.routeDealDetails,
          arguments: DealDetailsScreenArgs.dealId(
            dealId: notification.offerId,
            request: notification.request,
            departure: Location.from(label: notification.departureCity),
            arrival: Location.to(label: notification.arrivalCity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 36.0, bottom: 25.0, start: 23.0, end: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(notification.title, style: AppTextStyles.h2Bold),
                ),
                Text(
                  translations.alertsListNotificationsItemNotificationDate(
                    date: DateUIUtils.formatDateTimeDifference(
                        translations,
                        DateUtils.difference(
                            DateTime.now(), notification.lastCheck),
                        digits: 2,
                        separator: ' '),
                  ),
                  style: AppTextStyles.h5Medium
                      .copyWith(color: AppColors.notificationItemDate),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(_getNotificationDateRange(translations),
                      style: AppTextStyles.h4Medium),
                ),
                AlertsIconButton(
                  icon: AppIcons.close,
                  tooltip: translations
                      .alertsListNotificationsItemButtonDeleteTooltip,
                  onPressed: () {
                    context
                        .bloc<AlertsHistoryBloc>()
                        .removeNotification(notification.id);
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              notification.description,
              strutStyle:
                  StrutStyle(forceStrutHeight: true, height: 1, leading: 0.5),
            )
          ],
        ),
      ),
    );
  }

  String _getNotificationDateRange(Translations translations) {
    if (notification.outboundDate != null) {
      return translations
          .alertsListNotificationsItemNotificationDateRangeFlexible(
              startDate: _getNotificationDate(
                  translations, notification.outboundDate,
                  format: notification.outboundDate
                          .isSameMonth(notification.inboundDate)
                      ? 'd'
                      : null),
              endDate:
                  _getNotificationDate(translations, notification.inboundDate));
    } else {
      return translations.alertsListNotificationsItemNotificationFromDate(
        startDate:
            _getNotificationDate(translations, notification.outboundDate),
      );
    }
  }

  String _getNotificationDate(Translations translations, DateTime date,
      {String format}) {
    if (date != null) {
      return date.formatDate(format: format);
    } else {
      return translations.alertsListNotificationsItemNotificationDateUnknown;
    }
  }
}
