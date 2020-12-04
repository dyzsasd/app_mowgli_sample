import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/components/overlay.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/bloc/alert_editor_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/components/alert_editor_body.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/components/alert_editor_bottom.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/notifications_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:provider/provider.dart';

class DealDetailsAlertEditorScreen extends StatelessWidget {
  final DealDetailsAlertEditorScreenArgs args;

  DealDetailsAlertEditorScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return Provider(
      create: (_) => args,
      lazy: true,
      child: BlocCreatorWithConsumer<NotificationsBloc, NotificationsState>(
        create: (_) => NotificationsBloc(),
        listenWhen: (_, NotificationsState state) {
          return state.when((_) => true,
              initial: () => false, loading: () => false, error: (_) => true);
        },
        listener: (BuildContext context, NotificationsState state) {
          if (state.isSuccessful) {
            Navigator.of(context).pop(DealDetailsAlertEditorScreenResult(true));
          } else {
            // TODO
          }
        },
        builder: (BuildContext context, NotificationsState state) {
          return ProgressOverlay(
            topSafeArea: false,
            bottomSafeArea: false,
            showOverlay: state.when((_) => false,
                initial: () => false, loading: () => true, error: (_) => false),
            child: Scaffold(
              appBar: MowgliAppBar(
                context: context,
                title: Text(translations.createAlertScreenTitle),
                leading: const MowgliCloseButton(),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(100.0),
                    child: SizedBox(
                      height: 100.0,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          translations.createAlertScreenSubtitle(
                              departure: args.departureName,
                              arrival: args.arrivalName),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h2Bold,
                        ),
                      ),
                    )),
                bottomLineBorder: true,
              ),
              body: BlocProvider<DealDetailsAlertEditorBloc>(
                create: (_) => DealDetailsAlertEditorBloc(
                    args.initialFilters, args.currentFilters),
                child: Column(
                  children: <Widget>[
                    Expanded(child: DealDetailsAlertEditorBody()),
                    DealDetailsAlertEditorBottomButton()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DealDetailsAlertEditorScreenArgs {
  final Filters initialFilters;
  final Filters currentFilters;
  final Request request;
  final String arrivalName;
  final String departureName;
  final DealDetailsOffer offer;

  DealDetailsAlertEditorScreenArgs(
      {@required this.initialFilters,
      @required this.currentFilters,
      @required this.request,
      @required this.arrivalName,
      @required this.departureName,
      @required this.offer})
      : assert(initialFilters != null),
        assert(currentFilters != null),
        assert(arrivalName != null),
        assert(departureName != null),
        assert(request != null),
        assert(offer != null);

  static DealDetailsAlertEditorScreenArgs of(BuildContext context) {
    return Provider.of<DealDetailsAlertEditorScreenArgs>(context,
        listen: false);
  }
}

class DealDetailsAlertEditorScreenResult {
  final bool subscriptionRegistered;

  DealDetailsAlertEditorScreenResult(this.subscriptionRegistered);
}
