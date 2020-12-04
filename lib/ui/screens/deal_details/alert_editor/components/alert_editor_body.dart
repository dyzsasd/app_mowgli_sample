import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/alert_editor/bloc/alert_editor_bloc.dart';
import 'package:mowgli/ui/screens/filters/bloc/filters_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/budget/filters_budget_screen.dart';
import 'package:mowgli/ui/screens/filters/items/dates/filters_dates_screen.dart';
import 'package:mowgli/ui/screens/filters/items/flight_duration/filters_flight_duration_screen.dart';
import 'package:mowgli/ui/screens/filters/items/stopovers/filters_stopovers_screen.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/badge_utils.dart';

class DealDetailsAlertEditorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SeparatedListView(
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
    );
  }
}

class _FilterTravelDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealDetailsAlertEditorBloc, DealDetailsAlertEditorState>(
      buildWhen: (DealDetailsAlertEditorState oldState,
          DealDetailsAlertEditorState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is DealDetailsAlertEditorState &&
            newState is DealDetailsAlertEditorState) {
          return oldState?.filters?.dates != newState.filters.dates;
        }
        return false;
      },
      builder: (BuildContext context, DealDetailsAlertEditorState state) {
        Translations translations = Translations.of(context);

        return _ListItem(
          label: translations.filtersItemDates,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersDatesScreen(
                      FiltersDatesScreenArgs(state.filters.dates))),
            );

            if (res is DatesFilter) {
              context.bloc<DealDetailsAlertEditorBloc>().updateDatesWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(
      Translations translations, DealDetailsAlertEditorState state) {
    List<BadgeLabel> Function(Filters filters) extractBadges =
        (Filters filters) {
      if (filters.dates == null) {
        return [BadgeLabel(translations.createAlertItemDatesEmptyValue)];
      }

      return FilterBadgeUtils.getDatesBadges(translations, filters);
    };

    return extractBadges(state.filters);
  }
}

class _FilterStopOvers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealDetailsAlertEditorBloc, DealDetailsAlertEditorState>(
      buildWhen: (DealDetailsAlertEditorState oldState,
          DealDetailsAlertEditorState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is DealDetailsAlertEditorState &&
            newState is DealDetailsAlertEditorState) {
          return oldState?.filters?.stopOvers != newState.filters.stopOvers;
        }
        return false;
      },
      builder: (BuildContext context, DealDetailsAlertEditorState state) {
        Translations translations = Translations.of(context);

        return _ListItem(
          label: translations.filtersItemStopOvers,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersStopOversScreen(
                      FiltersStopOversScreenArgs(state.filters.stopOvers))),
            );

            if (res is StopOversFilter) {
              context
                  .bloc<DealDetailsAlertEditorBloc>()
                  .updateStopOversWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(
      Translations translations, DealDetailsAlertEditorState state) {
    List<BadgeLabel> Function(Filters) extractBadges = (Filters filters) {
      if (filters.stopOvers == null) {
        return [BadgeLabel(translations.createAlertItemStopOversEmptyValue)];
      }

      return FilterBadgeUtils.getStopOversBadges(translations, filters);
    };

    return extractBadges(state.filters);
  }
}

class _FilterFlightDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealDetailsAlertEditorBloc, DealDetailsAlertEditorState>(
      buildWhen: (DealDetailsAlertEditorState oldState,
          DealDetailsAlertEditorState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is DealDetailsAlertEditorState &&
            newState is DealDetailsAlertEditorState) {
          return oldState?.filters?.flightDuration !=
              newState.filters.flightDuration;
        }
        return false;
      },
      builder: (BuildContext context, DealDetailsAlertEditorState state) {
        Translations translations = Translations.of(context);

        return _ListItem(
          label: translations.filtersItemFlightDuration,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      FiltersFlightDurationScreen(
                          FiltersFlightDurationScreenArgs(
                              state.filters.flightDuration))),
            );

            if (res is FlightDurationFilter) {
              context
                  .bloc<DealDetailsAlertEditorBloc>()
                  .updateFlightDurationWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(
      Translations translations, DealDetailsAlertEditorState state) {
    List<BadgeLabel> Function(Filters) extractBadges = (Filters filters) {
      if (filters.flightDuration == null) {
        return [
          BadgeLabel(translations.createAlertItemFlightDurationEmptyValue)
        ];
      }

      return FilterBadgeUtils.getFlightDurationBadges(translations, filters);
    };

    return extractBadges(state.filters);
  }
}

class _FilterBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealDetailsAlertEditorBloc, DealDetailsAlertEditorState>(
      buildWhen: (DealDetailsAlertEditorState oldState,
          DealDetailsAlertEditorState newState) {
        if (oldState.runtimeType != newState.runtimeType) {
          return true;
        } else if (oldState is DealDetailsAlertEditorState &&
            newState is DealDetailsAlertEditorState) {
          return oldState?.filters?.budget != newState.filters.budget;
        }
        return false;
      },
      builder: (BuildContext context, DealDetailsAlertEditorState state) {
        Translations translations = Translations.of(context);

        return _ListItem(
          label: translations.filtersItemBudget,
          badges: getBadges(translations, state),
          onPressed: () async {
            Object res = await Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => FiltersBudgetScreen(
                      FiltersBudgetScreenArgs(state.filters.budget))),
            );

            if (res is BudgetFilter) {
              context.bloc<DealDetailsAlertEditorBloc>().updateBudgetWith(res);
            }
          },
        );
      },
    );
  }

  List<BadgeLabel> getBadges(
      Translations translations, DealDetailsAlertEditorState state) {
    List<BadgeLabel> Function(Filters) extractBadges = (Filters filters) {
      if (filters.budget == null) {
        return [BadgeLabel(translations.createAlertItemBudgetEmptyValue)];
      }

      return FilterBadgeUtils.getBudgetBadges(translations, filters);
    };

    return extractBadges(state.filters);
  }
}

class _ListItem extends StatelessWidget {
  final String label;
  final List<BadgeLabel> badges;
  final VoidCallback onPressed;

  _ListItem({@required this.label, this.badges, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListItemCell(
      label: label,
      badges: badges,
      onPressed: onPressed,
      icon: AppIcons.edit,
    );
  }
}
