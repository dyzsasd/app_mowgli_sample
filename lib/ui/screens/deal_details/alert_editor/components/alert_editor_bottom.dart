import 'package:flutter/material.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/ui/components/scaffold.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/alert_editor_screen.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/bloc/alert_editor_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/notifications_bloc.dart';

class DealDetailsAlertEditorBottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBottomButtonContainer(
      label: Translations.of(context).createAlertButtonCreate,
      onPressed: () {
        DealDetailsAlertEditorScreenArgs screenArgs =
            DealDetailsAlertEditorScreenArgs.of(context);

        DealDetailsOffer offer = screenArgs.offer;

        context.bloc<NotificationsBloc>().subscribeToNotifications(
            request: screenArgs.request.updateWithFilters(
                context.bloc<DealDetailsAlertEditorBloc>().state.filters),
            currentPrice: offer.price,
            currentPriceCurrency: offer.currency,
            dealId: offer.id,
            fromLabel: offer.originName,
            subscriptionType: SubscriptionType.dealGroup,
            toLabel: offer.destinationName);
      },
    );
  }
}
