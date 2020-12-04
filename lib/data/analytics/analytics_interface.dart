abstract class AnalyticsService {
  Future<void> init();

  Future<void> markNotificationsAs(bool enabled);

  Future<void> eventWalkthroughNotificationAccepted();

  Future<void> eventDestinationChanged(String destinationName);

  Future<void> eventOriginChanged(String originName);

  Future<void> eventHomePageSectionClicked(String sectionName);

  Future<void> eventDateRecommendationsClicked(String sectionName);

  Future<void> eventDealClicked(String originName, String destinationName,
      DateTime fromDate, DateTime toDate);

  Future<void> eventFiltersFlexibleDateChanged(
      DateTime fromDate, DateTime toDate);

  Future<void> eventFiltersFixedDateChanged(DateTime fromDate, DateTime toDate);

  Future<void> eventFiltersFlightDurationChanged(int min, int max);

  Future<void> eventFiltersStopOversChanged(bool none, bool one, bool many);

  Future<void> eventFiltersBudgetChanged(int maxAmount);

  Future<void> eventShareClicked();

  Future<void> eventShowMowgliTipsClicked();

  Future<void> eventCalendarDealsClicked();

  Future<void> eventSetupAlertEnabled(String originName, String destinationName,
      DateTime fromDate, DateTime toDate);

  Future<void> eventFollowDealEnabled(String originName, String destinationName,
      DateTime fromDate, DateTime toDate);

  Future<void> eventCheckAvailability(String originName, String destinationName,
      DateTime fromDate, DateTime toDate);

  Future<void> eventDestinationGroupEnabled();
}
