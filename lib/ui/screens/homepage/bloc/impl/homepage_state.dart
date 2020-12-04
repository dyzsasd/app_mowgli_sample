import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';

part 'homepage_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  factory HomePageState({@required HomePageContent data}) = _Homepage;

  factory HomePageState.loading({HomePageLocation location}) = _Loading;

  factory HomePageState.empty({HomePageLocation location}) = _Empty;

  factory HomePageState.error({HomePageLocation location}) = _Error;
}
