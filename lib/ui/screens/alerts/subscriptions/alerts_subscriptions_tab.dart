import 'package:flutter/material.dart' hide Slider;
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/components/alerts_empty_view.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/item/alerts_subscriptions_item.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';

class AlertsSubscriptionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlertsSubscriptionsBloc>(
        create: (BuildContext context) =>
            AlertsSubscriptionsBloc(context.bloc<AlertsBloc>()),
        lazy: false,
        child: BlocBuilder<AlertsSubscriptionsBloc, AlertsSubscriptionsState>(
          builder: (BuildContext context, AlertsSubscriptionsState state) {
            return state.when(
                (Iterable<AlertSubscription> subscriptions) =>
                    _AlertsSubscriptionsContent(subscriptions: subscriptions),
                loading: () => const _AlertsSubscriptionsLoading(),
                error: () => const _AlertsSubscriptionsError(),
                empty: () => const _AlertsSubscriptionsEmpty());
          },
        ));
  }
}

class _AlertsSubscriptionsContent extends StatelessWidget {
  final Iterable<AlertSubscription> subscriptions;

  _AlertsSubscriptionsContent({@required this.subscriptions})
      : assert(subscriptions != null);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: subscriptions.length,
        separatorBuilder: (BuildContext context, int position) {
          return const Separator();
        },
        itemBuilder: (BuildContext context, int position) {
          AlertSubscription subscription = subscriptions.elementAt(position);

          return AlertsSubscriptionItem(
              key: Key(subscription.subscriptionId),
              subscription: subscription);
        },
      ),
    );
  }
}

class _AlertsSubscriptionsLoading extends StatelessWidget {
  const _AlertsSubscriptionsLoading();

  @override
  Widget build(BuildContext context) {
    return const LoadingList();
  }
}

class _AlertsSubscriptionsError extends StatelessWidget {
  const _AlertsSubscriptionsError();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return ErrorList<AlertsSubscriptionsBloc>(
      errorLabel: translations.alertsListManageErrorMessage,
      retryLabel: translations.alertsListManageErrorButton,
      retryCallback: () {
        context.bloc<AlertsSubscriptionsBloc>().reloadHistory();
      },
    );
  }
}

class _AlertsSubscriptionsEmpty extends StatelessWidget {
  const _AlertsSubscriptionsEmpty();

  @override
  Widget build(BuildContext context) {
    return AlertsEmpty(label: Translations.of(context).alertsListManageEmpty);
  }
}
