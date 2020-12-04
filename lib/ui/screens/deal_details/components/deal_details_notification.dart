import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_images.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/alert_editor_screen.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/deal_details_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/impl/notifications_bloc_impl.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/notifications_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

class DealDetailsNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealDetailsBloc, DealDetailsState>(
        buildWhen: (DealDetailsState oldState, DealDetailsState newState) =>
            oldState.hasData != newState.hasData,
        builder: (BuildContext context, DealDetailsState state) {
          if (!state.hasData ||
              (state is DealDetailsStateData &&
                  state.data?.mainOffer == null)) {
            return const SizedBox();
          } else {
            return const _SubscribeToNotificationsCard();
          }
        });
  }
}

class _SubscribeToNotificationsCard extends StatelessWidget {
  const _SubscribeToNotificationsCard();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocProvider<NotificationsBloc>(
      create: (_) => NotificationsBloc(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 28.0),
        color: AppColors.dealDetailsNotificationsBackground,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(AppImages.illDealDetailsNotification),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    translations.dealDetailsNotificationsMessage(
                        destination: getDestination(
                            BlocProvider.of<DealDetailsBloc>(context).state)),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h4Bold.copyWith(
                        color: AppColors.dealDetailsNotificationsContent,
                        height: 1.3),
                  ),
                  const SizedBox(height: 10.0),
                  _SubscribeToNotificationsButton(onPressed: () async {
                    bool res = await ApplicationServices.notifications
                        .enableNotifications();

                    if (res == true) {
                      DealDetailsState state =
                          context.bloc<DealDetailsBloc>().state;

                      DealDetailsOffer offer = state.when(
                          (DealDetailsContent data, Filters filters) =>
                              data.mainOffer,
                          loading: () => null,
                          error: () => null);

                      Request request = state.when(
                          (DealDetailsContent data, Filters filters) =>
                              data.request,
                          loading: () => null,
                          error: () => null);

                      ApplicationServices.analytics.eventSetupAlertEnabled(
                          request.origin.code,
                          request.destination.codes?.join(','),
                          request.outboundDate?.date,
                          request.inboundDate?.date ??
                              request.outboundDate?.date);

                      Navigator.of(context).pushNamed(
                          AppRoutes.routeAlertCreator,
                          arguments: DealDetailsAlertEditorScreenArgs(
                              arrivalName: offer.destinationName,
                              currentFilters: request.filters,
                              departureName: offer.originName,
                              initialFilters: request.filters,
                              offer: offer,
                              request: request));
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDestination(DealDetailsState state) {
    return state.when(
        (DealDetailsContent data, Filters filters) =>
            '${data.mainOffer.originName} - ${data.mainOffer.destinationName}',
        loading: () => '-',
        error: () => '-');
  }
}

class _SubscribeToNotificationsButton extends StatelessWidget {
  final VoidCallback onPressed;

  _SubscribeToNotificationsButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (BuildContext context, NotificationsState state) {
      return AppButtonContainer(
          backgroundColor: state.maybeWhen(
              (_) => AppColors.buttonDarkBackground,
              orElse: () => AppColors.buttonDarkBackground,
              error: (_) => AppColors.buttonErrorBackground),
          contentColor: state.maybeWhen((_) => AppColors.buttonDarkContent,
              orElse: () => AppColors.buttonDarkContent,
              error: (_) => AppColors.buttonContent),
          child: Center(
            child: state.when((_) => _SuccessContainer(),
                initial: () => _InitialContainer(),
                loading: () => _LoadingContainer(),
                error: (_) => _ErrorContainer()),
          ),
          onPressed: onPressed);
    });
  }
}

class _InitialContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Translations.of(context).dealDetailsNotificationsButtonEnable,
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
    return Text(
      Translations.of(context).subscribeToNotificationsButtonSuccess,
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
