import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/components/list/section/section_list.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/deal_details_bloc.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/impl/notifications_bloc_impl.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/notifications_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/dialog_utils.dart';
import 'package:mowgli/ui/utils/platform_widget.dart';

class SubscribeToNotificationsButton extends StatefulWidget {
  final Request request;

  SubscribeToNotificationsButton({@required this.request});

  @override
  _SubscribeToNotificationsButton createState() =>
      _SubscribeToNotificationsButton(request: request);
}

class _SubscribeToNotificationsButton
    extends State<SubscribeToNotificationsButton> {
  final Request request;

  _SubscribeToNotificationsButton({@required this.request});

  @override
  Widget build(BuildContext context) {
    bool hasBottomPadding = MediaQuery.of(context).padding.bottom > 0;

    return BlocProvider<NotificationsBloc>(
      create: (_) => NotificationsBloc(request),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 8.0,
              bottom: hasBottomPadding ? 0.0 : 8.0,
              start: kSectionListHorizontalPadding,
              end: kSectionListHorizontalPadding),
          child: BlocConsumer<NotificationsBloc, NotificationsState>(
            listenWhen: (_, NotificationsState state) =>
                state.isNotificationsDisabledEvent,
            listener: (BuildContext context, _) {
              onNotificationsDisabled(context);
            },
            builder: (BuildContext context, NotificationsState state) {
              return AppButtonContainer(
                backgroundColor: state.maybeWhen((_) => null,
                    orElse: () => null,
                    error: (_) => AppColors.buttonErrorBackground),
                child: Center(
                  child: state.when((_) => _SuccessContainer(),
                      initial: () => _InitialContainer(),
                      loading: () => _LoadingContainer(),
                      error: (_) => _ErrorContainer()),
                ),
                onPressed: () => state.when((_) => <void>{},
                    initial: () => subscribeToNotifications(context),
                    loading: () => <void>{},
                    error: (_) => subscribeToNotifications(context)),
              );
            },
          ),
        ),
      ),
    );
  }

  void subscribeToNotifications(BuildContext context) {
    ApplicationServices.analytics.eventDestinationGroupEnabled();

    context.bloc<NotificationsBloc>().subscribeToNotifications();
  }

  void onNotificationsDisabled(BuildContext context) {
    Translations translations = Translations.of(context);

    DialogUtils.showErrorDialog(
      context,
      title: translations.notificationsDisabledDialogTitle,
      text: translations.notificationsDisabledDialogMessage,
      positiveAction: PlatformAlertDialogAction<Object>(
          title: translations.notificationsDisabledDialogPositive,
          isDefault: true,
          onPressed: (BuildContext context) {
            return ApplicationServices.notifications
                .openNotificationsSettings();
          }),
      negativeAction: PlatformAlertDialogAction<Object>(
        title: translations.notificationsDisabledDialogNegative,
      ),
    );
  }
}

class _InitialContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsetsDirectional.only(end: 15.0),
          child: Icon(AppIcons.bell),
        ),
        Expanded(
          child: Text(
            Translations.of(context).subscribeToNotificationsButtonInitial,
          ),
        )
      ],
    );
  }
}

class _LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}

class _SuccessContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsetsDirectional.only(end: 15.0),
          child: Icon(AppIcons.check),
        ),
        Expanded(
          child: Text(
            Translations.of(context).subscribeToNotificationsButtonSuccess,
          ),
        )
      ],
    );
  }
}

class _ErrorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Translations.of(context).subscribeToNotificationsButtonError,
    );
  }
}
