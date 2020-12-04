import 'package:mowgli/ui/screens/section_details/bloc/impl/section_details_state.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'section_details_event.dart';

class SectionDetailsBloc
    extends BaseBloc<_SectionDetailsEvent, SectionDetailsState> {
  SectionDetailsBloc() : super(_initialState());

  static SectionDetailsState _initialState() => SectionDetailsState();

  @override
  Stream<SectionDetailsState> mapEventToState(
      _SectionDetailsEvent event) async* {}
}
