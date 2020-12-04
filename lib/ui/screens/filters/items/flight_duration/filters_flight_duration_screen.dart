import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/components/filters_list_item.dart';
import 'package:mowgli/ui/screens/filters/items/flight_duration/bloc/filters_flight_duration_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/stopovers/bloc/filters_stopovers_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/num_utils.dart';

class FiltersFlightDurationScreen extends StatelessWidget {
  final FiltersFlightDurationScreenArgs args;

  FiltersFlightDurationScreen(this.args);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<FlightDurationFilterBloc,
        FlightDurationFilterState>(
      create: (_) => FlightDurationFilterBloc(
          args.flightDuration,
          NumUtils.parseInt(translations.filtersItemFlightDurationMinValue, 0),
          NumUtils.parseInt(
              translations.filtersItemFlightDurationMaxValue, 24)),
      listenWhen: (_, FlightDurationFilterState state) => state.isReady,
      listener: (BuildContext context, FlightDurationFilterState state) {
        Navigator.of(context).pop(state.duration);
      },
      child: Scaffold(
        appBar: MowgliAppBar(
          context: context,
          title: Text(translations.filtersItemFlightDuration),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<FlightDurationFilterBloc,
                      FlightDurationFilterState>(
                  buildWhen: (_, FlightDurationFilterState state) =>
                      state.isCurrent,
                  builder:
                      (BuildContext context, FlightDurationFilterState state) {
                    return FilterListSliderItem(
                      title: translations.filtersItemFlightDuration,
                      subtitle: translations.filtersItemFlightDurationSubtitle(
                          startDuration:
                              state.duration.minTime ?? state.minValue,
                          endDuration:
                              state.duration.maxTime ?? state.maxValue),
                      minValue: state.minValue,
                      maxValue: state.maxValue,
                      currentMinValue: state.duration.minTime,
                      currentMaxValue: state.duration.maxTime,
                      onMinChanged: (num value) {
                        context
                            .bloc<FlightDurationFilterBloc>()
                            .changeMinFlightDuration(value);
                      },
                      onMaxChanged: (num value) {
                        context
                            .bloc<FlightDurationFilterBloc>()
                            .changeMaxFlightDuration(value);
                      },
                    );
                  }),
            ),
            BlocBuilder<FlightDurationFilterBloc, FlightDurationFilterState>(
              builder: (BuildContext context, FlightDurationFilterState state) {
                return FiltersBottomButtonContainer(
                  visible: !state.isInitial,
                  label: translations.filtersButtonApply,
                  onPressed: () {
                    context.bloc<FlightDurationFilterBloc>().generateFilter();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FiltersFlightDurationScreenArgs {
  final FlightDurationFilter flightDuration;

  FiltersFlightDurationScreenArgs(this.flightDuration);
}
