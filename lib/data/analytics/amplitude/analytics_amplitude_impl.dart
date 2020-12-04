import 'package:amplitude_flutter/amplitude.dart';
import 'package:mowgli/data/analytics/analytics_interface.dart';
import 'package:mowgli/utils/date_utils.dart';

class AmplitudeAnalyticsImpl extends AnalyticsService {
  final Amplitude analytics = Amplitude.getInstance(instanceName: 'project');
  final String _apiKey;

  AmplitudeAnalyticsImpl(String apiKey) : _apiKey = apiKey;

  @override
  Future<void> init() async {
    await analytics.init(_apiKey);
    await analytics.enableCoppaControl();
    await analytics.trackingSessionEvents(true);
  }

  @override
  Future<void> markNotificationsAs(bool enabled) {
    return analytics
        .setUserProperties(<String, dynamic>{'notifications': enabled});
  }

  @override
  Future<void> eventWalkthroughNotificationAccepted() {
    return analytics
        .logEvent('accept notification', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.walkthrough,
    });
  }

  @override
  Future<void> eventDestinationChanged(String destinationName) {
    return analytics
        .logEvent('enter destination', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
      'destination': destinationName,
    });
  }

  @override
  Future<void> eventOriginChanged(String originName) {
    return analytics
        .logEvent('change origin', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
      'origin': originName,
    });
  }

  @override
  Future<void> eventHomePageSectionClicked(String sectionName) {
    return analytics
        .logEvent('deal category', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
      'section': sectionName,
    });
  }

  @override
  Future<void> eventDateRecommendationsClicked(String date) {
    return analytics
        .logEvent('date recommended', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
      'date': date,
    });
  }

  @override
  Future<void> eventDealClicked(String originName, String destinationName,
      DateTime fromDate, DateTime toDate) {
    return analytics.logEvent('deal viewed', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
      'origin': originName,
      'destination': destinationName,
      'departure date': fromDate?.dateToString(),
      'return date': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventFiltersFlexibleDateChanged(
      DateTime fromDate, DateTime toDate) {
    return analytics
        .logEvent('choose flexible dates', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.filter,
      'departure date': fromDate?.dateToString(),
      'return date': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventFiltersFixedDateChanged(
      DateTime fromDate, DateTime toDate) {
    return analytics
        .logEvent('choose fixed dates', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.filter,
      'departure date': fromDate?.dateToString(),
      'return date': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventFiltersFlightDurationChanged(int min, int max) {
    return analytics.logEvent('flight duration restrictions',
        eventProperties: <String, dynamic>{
          _EventProperties.category: _EventCategories.filter,
          'min': min,
          'max': max,
        });
  }

  @override
  Future<void> eventFiltersStopOversChanged(bool none, bool one, bool many) {
    int value = -1;
    if (none) {
      value = 0;
    } else if (one) {
      value = 1;
    } else if (many) {
      value = 2;
    }

    return analytics
        .logEvent('stopover restrictions', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.filter,
      'maximum stopover allowed': value,
    });
  }

  @override
  Future<void> eventFiltersBudgetChanged(int maxAmount) {
    return analytics
        .logEvent('budget restrictions', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.filter,
      'amount': maxAmount,
    });
  }

  @override
  Future<void> eventShareClicked() {
    return analytics
        .logEvent('share button', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
    });
  }

  @override
  Future<void> eventShowMowgliTipsClicked() {
    return analytics.logEvent('deal opened', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
    });
  }

  @override
  Future<void> eventCalendarDealsClicked() {
    return analytics
        .logEvent('calendar button', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.browse,
    });
  }

  @override
  Future<void> eventSetupAlertEnabled(String originName, String destinationName,
      DateTime fromDate, DateTime toDate) {
    return analytics.logEvent('setup alert', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.alert,
      'origin': originName,
      'destination': destinationName,
      'departure date range': fromDate?.dateToString(),
      'return date range': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventFollowDealEnabled(String originName, String destinationName,
      DateTime fromDate, DateTime toDate) {
    return analytics.logEvent('follow deal', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.alert,
      'origin': originName,
      'destination': destinationName,
      'departure date': fromDate?.dateToString(),
      'return date': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventCheckAvailability(String originName, String destinationName,
      DateTime fromDate, DateTime toDate) {
    return analytics
        .logEvent('check availability', eventProperties: <String, dynamic>{
      _EventProperties.category: _EventCategories.conversation,
      'origin': originName,
      'destination': destinationName,
      'departure date': fromDate?.dateToString(),
      'return date': toDate?.dateToString(),
    });
  }

  @override
  Future<void> eventDestinationGroupEnabled() {
    return analytics.logEvent('destination group');
  }
}

class _EventCategories {
  static const String walkthrough = 'onboarding';
  static const String browse = 'browse';
  static const String filter = 'filter';
  static const String alert = 'alert';
  static const String conversation = 'conversation';
}

class _EventProperties {
  static const String category = 'category';
}
