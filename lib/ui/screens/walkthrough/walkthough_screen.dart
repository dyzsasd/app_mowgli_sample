import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/walkthrough/bloc/walkthrough_bloc.dart';
import 'package:mowgli/ui/screens/walkthrough/step1/walkthrough_step1_screen.dart';
import 'package:mowgli/ui/screens/walkthrough/step2/walkthrough_step2_screen.dart';
import 'package:mowgli/ui/utils/status_bar.dart';

class WalkthroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      style: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.walkthroughBackground,
        body: BlocProvider<WalkthroughBloc>(
          create: (_) => WalkthroughBloc(),
          child: BlocConsumer<WalkthroughBloc, WalkthroughState>(
            listenWhen: (_, WalkthroughState n) =>
                n.when((WalkthroughStep step) => false, connected: () => true),
            listener: (BuildContext context, _) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.routeHome);
            },
            builder: (BuildContext context, WalkthroughState state) {
              Widget child = state.when((WalkthroughStep step) {
                switch (step) {
                  case WalkthroughStep.step2:
                    return WillPopScope(
                      onWillPop: () async {
                        context.bloc<WalkthroughBloc>().openStep1();
                        return false;
                      },
                      child: WalkthroughStep2Screen(
                        onNextStepClicked: () {
                          context
                              .bloc<WalkthroughBloc>()
                              .markWalkthroughAsSeen();
                        },
                      ),
                    );
                  case WalkthroughStep.step1:
                  default:
                    return WalkthroughStep1Screen(
                      onNextStepClicked: () {
                        context.bloc<WalkthroughBloc>().openStep2();
                      },
                    );
                }
              }, connected: () => const SizedBox());

              return PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child,
                    Animation<double> primaryAnimation,
                    Animation<double> secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    fillColor: AppColors.walkthroughBackground,
                  );
                },
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
