import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/bloc/filters_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/components/filters_list_item.dart';
import 'package:mowgli/ui/screens/filters/items/budget/filters_budget_screen.dart';
import 'package:mowgli/ui/screens/filters/items/dates/filters_dates_screen.dart';
import 'package:mowgli/ui/screens/filters/items/flight_duration/filters_flight_duration_screen.dart';
import 'package:mowgli/ui/screens/filters/items/stopovers/filters_stopovers_screen.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/badge_utils.dart';

class FiltersScreen extends StatelessWidget {
  final FiltersScreenArgs args;

  FiltersScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FiltersBloc>(
      create: (_) => FiltersBloc(args.filters),
      child: BlocListener<FiltersBloc, FiltersState>(
        listenWhen: (_, FiltersState state) => state is FiltersReadyState,
        listener: (BuildContext context, FiltersState state) {
          Navigator.of(context)
              .pop((state as FiltersReadyState).currentFilters);
        },
        child: _FiltersHomePage(),
      ),
    );
  }
}

class FiltersScreenArgs {
  final Filters filters;

  FiltersScreenArgs({this.filters});

  FiltersScreenArgs.noFilter() : filters = null;
}

class _FiltersHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _FiltersAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SeparatedListView(
              itemCount: 4,
              itemBuilder: (BuildContext context, int position) {
                switch (position) {
                  case 0:
                    return _FilterTravelDates();
                  case 1:
                    return _FilterStopOvers();
                  case 2:
                    return _FilterFlightDuration();
                  case 3:
                    return _FilterBudget();
                }

                throw Exception('Not supported!');
              },
              cacheExtent: 79.0,
            ),
          ),
          BlocBuilder<FiltersBloc, FiltersState>(
            buildWhen: (_, FiltersState state) =>
                state.initialFilters != state.filters,
            builder: (BuildContext context, FiltersState state) {
              return FiltersBottomButtonContainer(
                visible: state.initialFilters != state.filters,
                label: Translations.of(context).filtersButtonCreate,
                onPressed: () {
                  context.bloc<FiltersBloc>().generateFilter();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _FiltersAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return MowgliAppBar(
      context: context,
      title: Text(translations.filtersScreenTitle),
      leading: MowgliCloseButton(
        tooltip: translations.filtersButtonCloseTooltip,
      ),
      actions: <Widget>[
        _VisibleWidget(
            builder: (BuildContext context) => AppBarTextMenu(
                  label: translations.filtersMenuDeleteFilters,
                  onPressed: () {
                    context.bloc<FiltersBloc>().clearFilter();
                  },
                ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FilterTravelDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      buildWhen: (FiltersState oldState, FiltersState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is FiltersDataState &&
            newState is FiltersDataState) {
          return oldState?.filters?.dates != newState.filters.dates;
        }
        return false;
      },
      builder: (BuildContext context, FiltersState state) {
        Translations translations = Translations.of(context);

        return FilterListItem(
          label: translations.filtersItemDates,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersDatesScreen(
                      FiltersDatesScreenArgs(state.maybeWhen(
                          (Filters value, _) => value.dates,
                          orElse: () => null)))),
            );

            if (res is DatesFilter) {
              context.bloc<FiltersBloc>().updateDatesWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(Translations translations, FiltersState state) {
    List<BadgeLabel> Function(Filters filters, Object) extractBadges =
        (Filters filters, _) {
      return FilterBadgeUtils.getDatesBadges(translations, filters);
    };

    return state.when(extractBadges, empty: (_) => null, ready: extractBadges);
  }
}

class _FilterStopOvers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      buildWhen: (FiltersState oldState, FiltersState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is FiltersDataState &&
            newState is FiltersDataState) {
          return oldState?.filters?.stopOvers != newState.filters.stopOvers;
        }
        return false;
      },
      builder: (BuildContext context, FiltersState state) {
        Translations translations = Translations.of(context);

        return FilterListItem(
          label: translations.filtersItemStopOvers,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersStopOversScreen(
                      FiltersStopOversScreenArgs(state.maybeWhen(
                          (Filters value, _) => value.stopOvers,
                          orElse: () => null)))),
            );

            if (res is StopOversFilter) {
              context.bloc<FiltersBloc>().updateStopOversWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(Translations translations, FiltersState state) {
    List<BadgeLabel> Function(Filters, Object) extractBadges =
        (Filters filters, _) {
      return FilterBadgeUtils.getStopOversBadges(translations, filters);
    };

    return state.when(extractBadges, empty: (_) => null, ready: extractBadges);
  }
}

class _FilterFlightDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      buildWhen: (FiltersState oldState, FiltersState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is FiltersDataState &&
            newState is FiltersDataState) {
          return oldState?.filters?.flightDuration !=
              newState.filters.flightDuration;
        }
        return false;
      },
      builder: (BuildContext context, FiltersState state) {
        Translations translations = Translations.of(context);

        return FilterListItem(
          label: translations.filtersItemFlightDuration,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      FiltersFlightDurationScreen(
                          FiltersFlightDurationScreenArgs(state.maybeWhen(
                              (Filters value, _) => value.flightDuration,
                              orElse: () => null)))),
            );

            if (res is FlightDurationFilter) {
              context.bloc<FiltersBloc>().updateFlightDurationWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(Translations translations, FiltersState state) {
    List<BadgeLabel> Function(Filters, Object) extractBadges =
        (Filters filters, _) {
      return FilterBadgeUtils.getFlightDurationBadges(translations, filters);
    };

    return state.when(extractBadges, empty: (_) => null, ready: extractBadges);
  }
}

class _FilterBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      buildWhen: (FiltersState oldState, FiltersState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is FiltersDataState &&
            newState is FiltersDataState) {
          return oldState?.filters?.budget != newState.filters.budget;
        }
        return false;
      },
      builder: (BuildContext context, FiltersState state) {
        Translations translations = Translations.of(context);

        return FilterListItem(
          label: translations.filtersItemBudget,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersBudgetScreen(
                      FiltersBudgetScreenArgs(state.maybeWhen(
                          (Filters value, _) => value.budget,
                          orElse: () => null)))),
            );

            if (res is BudgetFilter) {
              context.bloc<FiltersBloc>().updateBudgetWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(Translations translations, FiltersState state) {
    List<BadgeLabel> Function(Filters, Object) extractBadges =
        (Filters filters, _) {
      return FilterBadgeUtils.getBudgetBadges(translations, filters);
    };

    return state.when(extractBadges, empty: (_) => null, ready: extractBadges);
  }
}

class _VisibleWidget extends StatelessWidget {
  final WidgetBuilder builder;

  _VisibleWidget({this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (BuildContext context, FiltersState state) {
        return Visibility(
          visible: state.isNotEmpty,
          child: builder(context),
        );
      },
    );
  }
}
