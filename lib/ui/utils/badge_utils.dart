import 'package:mowgli/app/app.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:mowgli/utils/num_utils.dart';

class FilterBadgeUtils {
  const FilterBadgeUtils._();

  static List<BadgeLabel> getDatesBadges(
      Translations translations, Filters filters) {
    if (filters?.dates == null) {
      return null;
    }

    List<BadgeLabel> badges = <BadgeLabel>[];

    if (filters.dates.flexibleDates != null) {
      badges.add(BadgeLabel(translations.travelDatesFlexibleRangeSubtitle(
        startDate: filters.dates.flexibleDates.fromDate.formatDate(
            format: filters.dates.flexibleDates.fromDate.year !=
                    filters.dates.flexibleDates.toDate.year
                ? DateUtils.kDateWithYearFormat
                : null),
        endDate: filters.dates.flexibleDates.toDate
            .formatDate(format: DateUtils.kDateWithYearFormat),
      )));

      String label;
      if (filters.dates.flexibleDates.maxDuration == env.maxJourneyDays) {
        label = translations.travelDatesFlexibleTripDurationSubtitleMax(
            minLength: filters.dates.flexibleDates.minDuration,
            maxLength: filters.dates.flexibleDates.maxDuration);
      } else if (filters.dates.flexibleDates.maxDuration == null) {
        label = translations.travelDatesFlexibleTripDurationSubtitleMax(
            minLength: filters.dates.flexibleDates.minDuration,
            maxLength: env.maxJourneyDays);
      } else {
        label = translations.travelDatesFlexibleTripDurationSubtitle(
            minLength: filters.dates.flexibleDates.minDuration,
            maxLength: filters.dates.flexibleDates.maxDuration);
      }

      badges.add(BadgeLabel(label));
    } else if (filters.dates.fixedDates != null) {
      badges.add(BadgeLabel(translations.travelDatesTabFixedSubtitle(
        fromDate: filters.dates.fixedDates.fromDate.formatDate(
            format: filters.dates.fixedDates.fromDate.year !=
                    filters.dates.fixedDates.toDate.year
                ? DateUtils.kDateWithYearFormat
                : null),
        toDate: filters.dates.fixedDates.toDate
            .formatDate(format: DateUtils.kDateWithYearFormat),
      )));

      if (filters.dates.fixedDates.flexible) {
        badges.add(BadgeLabel(translations.travelDatesButtonFlexible));
      }
    }

    return badges;
  }

  static List<BadgeLabel> getStopOversBadges(
      Translations translations, Filters filters) {
    if (filters?.stopOvers == null) {
      return null;
    }

    List<BadgeLabel> badges = <BadgeLabel>[];

    if (filters.stopOvers.direct == true) {
      badges.add(BadgeLabel(translations.filtersStopsItemStopOversNone));
    }

    if (filters.stopOvers.one == true) {
      badges.add(BadgeLabel(translations.filtersStopsItemStopOversOne));
    }

    if (filters.stopOvers.many == true) {
      badges.add(BadgeLabel(translations.filtersStopsItemStopOversMultiple));
    }

    return badges;
  }

  static List<BadgeLabel> getFlightDurationBadges(
      Translations translations, Filters filters) {
    if (filters?.flightDuration == null) {
      return null;
    }

    return <BadgeLabel>[
      BadgeLabel(translations.filtersItemFlightDurationSubtitle(
          startDuration: filters.flightDuration.minTime ??
              NumUtils.parseInt(translations.filtersItemFlightDurationMinValue),
          endDuration: filters.flightDuration.maxTime ??
              NumUtils.parseInt(
                  translations.filtersItemFlightDurationMaxValue)))
    ];
  }

  static List<BadgeLabel> getBudgetBadges(
      Translations translations, Filters filters) {
    if (filters?.budget == null) {
      return null;
    }

    return <BadgeLabel>[
      BadgeLabel(translations.filtersItemBudgetSubtitle(
          startBudget: filters.budget.min ??
              NumUtils.parseInt(translations.filtersItemBudgetMinValue),
          endBudget: filters.budget.max ??
              NumUtils.parseInt(translations.filtersItemBudgetMaxValue)))
    ];
  }
}
