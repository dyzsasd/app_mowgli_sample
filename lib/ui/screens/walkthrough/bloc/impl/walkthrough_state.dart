import 'package:freezed_annotation/freezed_annotation.dart';

part 'walkthrough_state.freezed.dart';

@freezed
abstract class WalkthroughState with _$WalkthroughState {
  factory WalkthroughState({@required WalkthroughStep step}) =
      _WalkthroughState;

  factory WalkthroughState.connected() = _UserConnected;
}

enum WalkthroughStep { step1, step2 }
