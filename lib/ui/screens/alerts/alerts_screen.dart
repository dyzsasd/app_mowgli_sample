import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/history/alerts_history_tab.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/alerts_subscriptions_tab.dart';
import 'package:mowgli/ui/utils/dialog_utils.dart';
import 'package:mowgli/ui/utils/platform_widget.dart';

class AlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocProvider<AlertsBloc>(
        create: (_) => AlertsBloc(),
        lazy: false,
        child: BlocListener<AlertsBloc, AlertsState>(
          listenWhen: (_, AlertsState newState) => newState.hasError,
          listener: (BuildContext context, AlertsState state) {
            DialogUtils.showErrorDialog(
              context,
              text: translations.alertsListError,
              positiveAction: PlatformAlertDialogAction<Null>(
                  title: Translations.of(context).genericDialogPositiveLabel,
                  onPressed: (BuildContext context) async {
                    Navigator.of(context).maybePop();
                    return null;
                  }),
            );
          },
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: MowgliAppBar(
                context: context,
                title: Text(Translations.of(context).alertsListScreenTitle),
                bottom: TabBar(
                  tabs: <Tab>[
                    Tab(text: translations.alertsListTabNotifications),
                    Tab(text: translations.alertsListTabManage),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  AlertsHistoryTab(),
                  AlertsSubscriptionsTab(),
                ],
              ),
            ),
          ),
        ));
  }
}
