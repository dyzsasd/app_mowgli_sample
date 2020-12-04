import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/resources/resources.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/walkthrough/bloc/walkthrough_bloc.dart';
import 'package:mowgli/ui/screens/walkthrough/shared/walkthrough_shared.dart';
import 'package:mowgli/ui/utils/dialog_utils.dart';
import 'package:mowgli/ui/utils/platform_widget.dart';

class WalkthroughStep2Screen extends StatelessWidget {
  final VoidCallback onNextStepClicked;

  WalkthroughStep2Screen({@required this.onNextStepClicked})
      : assert(onNextStepClicked != null);

  @override
  Widget build(BuildContext context) {
    final Translations translations = Translations.of(context);

    return WalkthroughContainer(
      imageSrc: AppImages.walkthroughStep2,
      title: translations.walkthroughStep2Line1,
      subtitle: translations.walkthroughStep2Line2,
      positiveLabel: translations.walkthroughStep2PositiveButton,
      positiveCallback: () async {
        await enabledNotifications(context);
        context.bloc<WalkthroughBloc>().markWalkthroughAsSeen();
      },
      negativeLabel: translations.walkthroughStep2NegativeButton,
      negativeCallback: onNextStepClicked,
    );
  }

  Future<void> enabledNotifications(BuildContext context) async {
    await ApplicationServices.analytics.eventWalkthroughNotificationAccepted();
    bool res = await ApplicationServices.notifications.enableNotifications();
    await ApplicationServices.analytics.markNotificationsAs(res ?? false);

    if (res == false) {
      Translations translations = Translations.of(context);

      await DialogUtils.showErrorDialog(
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
}
