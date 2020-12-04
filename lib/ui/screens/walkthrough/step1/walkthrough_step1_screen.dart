import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/resources.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/walkthrough/shared/walkthrough_shared.dart';

class WalkthroughStep1Screen extends StatelessWidget {
  final VoidCallback onNextStepClicked;

  WalkthroughStep1Screen({@required this.onNextStepClicked})
      : assert(onNextStepClicked != null);

  @override
  Widget build(BuildContext context) {
    final Translations translations = Translations.of(context);

    return WalkthroughContainer(
      imageSrc: AppImages.walkthroughStep1,
      title: translations.walkthroughStep1Line1,
      subtitle: translations.walkthroughStep1Line2,
      positiveLabel: translations.walkthroughStep1PositiveButton,
      positiveCallback: onNextStepClicked,
    );
  }
}
