import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/slider.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/price_calendar/bloc/price_calendar_bloc.dart';
import 'package:mowgli/ui/screens/price_calendar/model/price_calendar_model.dart';

class PriceCalendarFlightDurationOverride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 23.0),
      child: BlocBuilder<PriceCalendarBloc, PriceCalendarState>(
        buildWhen: (_, PriceCalendarState state) => state.isCalendarReady,
        builder: (BuildContext context, PriceCalendarState state) {
          if (!state.isCalendarReady) {
            return const SizedBox();
          }

          PriceCalendarContent screenContent = state.content;

          int currentMinValue = screenContent.minFlightDurationSelected ??
              screenContent.minFlightDurationAllowed;
          int currentMaxValue = screenContent.maxFlightDurationSelected ??
              screenContent.maxFlightDurationAllowed;

          bool maxValueReached =
              currentMaxValue == screenContent.maxFlightDurationAllowed;

          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      translations.priceCalendarFlightDurationTitle,
                      style: AppTextStyles.h2Bold,
                    ),
                  ),
                  Text(
                    maxValueReached
                        ? translations.priceCalendarFlightDurationValueMax(
                            minLength: currentMinValue,
                            maxLength: currentMaxValue)
                        : translations.priceCalendarFlightDurationValue(
                            minLength: currentMinValue,
                            maxLength: currentMaxValue),
                  )
                ],
              ),
              const SizedBox(height: 18.0),
              EasySlider(
                minValue: screenContent.minFlightDurationAllowed,
                maxValue: screenContent.maxFlightDurationAllowed,
                currentMinValue: currentMinValue,
                currentMaxValue: currentMaxValue,
                onMinChanged: (num value) {
                  context
                      .bloc<PriceCalendarBloc>()
                      .updateMinFlightDuration(value);
                },
                onMaxChanged: (num value) {
                  context
                      .bloc<PriceCalendarBloc>()
                      .updateMaxFlightDuration(value);
                },
                onThumbUp: () {
                  context.bloc<PriceCalendarBloc>().reloadPrices();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
