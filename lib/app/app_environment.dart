abstract class ApplicationEnvironment {
  bool get isADebugBuild;

  AppEnvironmentType get appEnvironment;

  String get subscriptionAPIUrl;

  String get smartCacheAPIUrl;

  String get autocompletionAPIUrl;

  String get requestsApiKey;

  Duration get defaultDuration;

  int get minJourneyDays;

  int get maxJourneyDays;

  int get maxFlexibleDateRange;
}

enum AppEnvironmentType {
  development,
  production,
}
