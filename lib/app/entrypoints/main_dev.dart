import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:flutter_fimber_filelogger/flutter_fimber_filelogger.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/app/app_environment.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/airports/airports_interface.dart';
import 'package:mowgli/data/airports/mobile/airports_mobile.dart';
import 'package:mowgli/data/analytics/amplitude/analytics_amplitude.dart';
import 'package:mowgli/data/analytics/analytics_interface.dart';
import 'package:mowgli/data/location/location_interface.dart';
import 'package:mowgli/data/location/mobile/location_mobile.dart';
import 'package:mowgli/data/logs/fimber/logs_fimber.dart';
import 'package:mowgli/data/logs/logs_interface.dart';
import 'package:mowgli/data/network/dio/network_dio.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/data/notifications/mobile/notifications_mobile.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/data/push/fcm/push_fcm.dart';
import 'package:mowgli/data/push/push_interface.dart';
import 'package:mowgli/data/session/mobile/user_session_impl.dart';
import 'package:mowgli/data/session/user_session.dart';
import 'package:mowgli/data/storage/hive/storage_hive.dart';
import 'package:mowgli/data/storage/storage.dart';

void main() {
  launchApp(const ApplicationData(
      services: _DevAppServices(), environment: _DevAppEnv()));
}

class _DevAppEnv implements ApplicationEnvironment {
  const _DevAppEnv();

  @override
  AppEnvironmentType get appEnvironment => AppEnvironmentType.development;

  @override
  bool get isADebugBuild => true;

  @override
  String get smartCacheAPIUrl =>
      'https://mowgli-api-stg.winglet.io/smartcache/v1/';

  @override
  String get autocompletionAPIUrl =>
      'https://mowgli-api-stg.winglet.io/autocompletion/v1/';

  @override
  String get subscriptionAPIUrl =>
      'https://mowgli-api-stg.winglet.io/subscription/v1/';

  @override
  String get requestsApiKey => '{requests_key}';

  @override
  Duration get defaultDuration => const Duration(days: 365);

  @override
  int get maxFlexibleDateRange => 3;

  @override
  int get minJourneyDays => 1;

  @override
  int get maxJourneyDays => 20;
}

class _DevAppServices implements ApplicationServicesProvider {
  const _DevAppServices();

  @override
  AirportsService get airports => AirportsMobileImpl();

  @override
  AnalyticsService get analytics => AmplitudeAnalyticsImpl('{amplitude_key}');

  @override
  LocationService get location => LocationMobileImpl();

  @override
  LogsService get logs => LogsFimberImpl(<LogTree>{
        DebugBufferTree(logLevels: <String>['V', 'D', 'I', 'W', 'E']),
        FileLoggerTree(numberOfDays: 5)
      });

  @override
  PushService get push => PushFCMImpl();

  @override
  NetworkService get network => NetworkDioImpl();

  @override
  NotificationsService get notifications => NotificationsMobileImpl();

  @override
  UserSession get session => UserSessionImpl();

  @override
  Storage get storage => StorageWithHive();
}
