import 'package:flutter/material.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/price_calendar/bloc/price_calendar_bloc.dart';
import 'package:mowgli/ui/screens/price_calendar/components/price_calendar_button.dart';
import 'package:mowgli/ui/screens/price_calendar/components/price_calendar_deals.dart';
import 'package:mowgli/ui/screens/price_calendar/components/price_calendar_flight_duration.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';

class PriceCalendarScreen extends StatelessWidget {
  final PriceCalendarScreenArgs args;

  PriceCalendarScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<PriceCalendarBloc, PriceCalendarState>(
        create: (BuildContext context) {
          int minValue = env.minJourneyDays;
          int maxValue = env.maxJourneyDays;

          return PriceCalendarBloc(
              request: args.request,
              filters: args.filtersOverride,
              minFlightDurationAllowed: minValue,
              maxFlightDurationAllowed: maxValue);
        },
        listenWhen: (_, PriceCalendarState state) => state.isReady,
        listener: (BuildContext context, PriceCalendarState state) {
          Filters filters = state.maybeWhen(
            (_) => null,
            ready: (_, Filters filters, __) => filters,
            orElse: () => null,
          );

          String dealId = state.maybeWhen(
            (_) => null,
            ready: (_, __, String dealId) => dealId,
            orElse: () => null,
          );

          if (filters != null) {
            Navigator.of(context)
                .pop(PriceCalendarScreenResult(filters, dealId));
          }
        },
        lazy: false,
        child: Scaffold(
          appBar: MowgliAppBar(
            context: context,
            leading: const MowgliCloseButton(),
            bottomLineBorder: false,
            title: Text(translations.priceCalendarScreenTitle),
          ),
          body: BlocBuilder<PriceCalendarBloc, PriceCalendarState>(
            builder: (BuildContext context, PriceCalendarState state) {
              return state.when(
                (_) => _PriceCalendarBody(),
                ready: (_, __, ___) => _PriceCalendarBody(),
                initial: (_) => const _PriceCalendarLoading(),
                loading: (_) => const _PriceCalendarLoading(),
                error: (_) => const _PriceCalendarError(),
              );
            },
          ),
        ));
  }
}

class PriceCalendarScreenArgs {
  final Request request;
  final Filters filtersOverride;

  PriceCalendarScreenArgs(this.request, this.filtersOverride)
      : assert(request != null);
}

class PriceCalendarScreenResult {
  final Filters filters;
  final String dealId;

  PriceCalendarScreenResult(this.filters, this.dealId)
      : assert(filters != null);
}

class _PriceCalendarLoading extends StatelessWidget {
  const _PriceCalendarLoading();

  @override
  Widget build(BuildContext context) {
    if (context.bloc<PriceCalendarBloc>().state.isCalendarReady) {
      return const _PriceCalendarBody();
    } else {
      return const LoadingList();
    }
  }
}

class _PriceCalendarError extends StatelessWidget {
  const _PriceCalendarError();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return ErrorList<PriceCalendarBloc>(
      errorLabel: translations.priceCalendarErrorMessage,
      retryLabel: translations.priceCalendarErrorButton,
    );
  }
}

class _PriceCalendarBody extends StatelessWidget {
  const _PriceCalendarBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Column(
            children: <Widget>[
              PriceCalendarFlightDurationOverride(),
              const Separator(),
              Expanded(child: PriceCalendarView())
            ],
          ),
        ),
        Positioned.fill(top: null, child: PriceCalendarValidateButton())
      ],
    );
  }
}
