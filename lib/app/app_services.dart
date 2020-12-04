import 'package:get_it/get_it.dart';
import 'package:mowgli/data/airports/airports_interface.dart';
import 'package:mowgli/data/analytics/analytics_interface.dart';
import 'package:mowgli/data/location/location_interface.dart';
import 'package:mowgli/data/logs/logs_interface.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/data/push/push_interface.dart';
import 'package:mowgli/data/session/user_session.dart';
import 'package:mowgli/data/storage/storage.dart';

abstract class ApplicationServicesProvider {
  AirportsService get airports;

  AnalyticsService get analytics;

  LocationService get location;

  LogsService get logs;

  NetworkService get network;

  NotificationsService get notifications;

  PushService get push;

  UserSession get session;

  Storage get storage;
}

class ApplicationServices {
  const ApplicationServices._();

  static Future<void> register(ApplicationServicesProvider provider) {
    assert(provider != null);

    GetIt.instance
      ..registerSingletonAsync<Storage>(() async {
        Storage storage = provider.storage;
        await storage.init();
        return storage;
      })
      ..registerSingletonAsync<AnalyticsService>(() async {
        AnalyticsService analytics = provider.analytics;
        await analytics.init();
        return analytics;
      })
      ..registerSingletonAsync<LogsService>(() async {
        LogsService logs = provider.logs;
        await logs.init();
        return logs;
      })
      ..registerSingletonAsync<NetworkService>(() async {
        NetworkService network = provider.network;
        await network.init();
        return network;
      })
      ..registerSingletonAsync<NotificationsService>(() async {
        NotificationsService notifications = provider.notifications;
        await notifications.init();
        return notifications;
      }, dependsOn: <Type>[Storage])
      ..registerSingletonAsync<PushService>(() async {
        PushService push = provider.push;
        await push.init();
        return push;
      }, dependsOn: <Type>[NetworkService, NotificationsService])
      ..registerSingletonAsync<UserSession>(() async {
        UserSession session = provider.session;
        await session.init();
        return session;
      }, dependsOn: <Type>[Storage])
      ..registerSingletonAsync<LocationService>(() async {
        LocationService location = provider.location;
        await location.init();
        return location;
      }, dependsOn: <Type>[Storage])
      ..registerSingletonAsync<AirportsService>(() async {
        AirportsService airports = provider.airports;
        await airports.init();
        return airports;
      }, dependsOn: <Type>[Storage]);

    return GetIt.instance.allReady();
  }

  static AirportsService get airports => GetIt.instance.get<AirportsService>();

  static AnalyticsService get analytics =>
      GetIt.instance.get<AnalyticsService>();

  static LocationService get location => GetIt.instance.get<LocationService>();

  static LogsService get logs => GetIt.instance.get<LogsService>();

  static NetworkService get network => GetIt.instance.get<NetworkService>();

  static NotificationsService get notifications =>
      GetIt.instance.get<NotificationsService>();

  static PushService get push => GetIt.instance.get<PushService>();

  static UserSession get session => GetIt.instance.get<UserSession>();

  static Storage get storage => GetIt.instance.get<Storage>();
}
