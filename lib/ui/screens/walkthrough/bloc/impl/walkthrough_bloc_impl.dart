import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/screens/walkthrough/bloc/impl/walkthrough_event.dart';
import 'package:mowgli/ui/screens/walkthrough/bloc/impl/walkthrough_state.dart';

class WalkthroughBloc extends Bloc<Event, WalkthroughState> {
  WalkthroughBloc() : super(WalkthroughState(step: WalkthroughStep.step1));

  void openStep1() {
    add(const OpenStep1Event());
  }

  void openStep2() {
    add(const OpenStep2Event());
  }

  void markWalkthroughAsSeen() {
    add(const MarkWalkthroughAsSeen());
  }

  @override
  Stream<WalkthroughState> mapEventToState(Event event) async* {
    if (ApplicationServices.session.isUserConnected()) {
      yield WalkthroughState.connected();
      return;
    }

    if (event is OpenStep1Event) {
      yield await _onLaunchStep1();
    } else if (event is OpenStep2Event) {
      yield await _onLaunchStep2();
    } else if (event is MarkWalkthroughAsSeen) {
      yield await _onMarkWalkthroughAsSeen();
    }
  }

  Future<WalkthroughState> _onLaunchStep1() async =>
      WalkthroughState(step: WalkthroughStep.step1);

  Future<WalkthroughState> _onLaunchStep2() async =>
      WalkthroughState(step: WalkthroughStep.step2);

  Future<WalkthroughState> _onMarkWalkthroughAsSeen() async {
    await ApplicationServices.session.setUserConnected(true);
    return WalkthroughState.connected();
  }
}
