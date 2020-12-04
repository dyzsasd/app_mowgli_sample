import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl_standalone.dart';
import 'package:mowgli/app/app_environment.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/main.dart';

void launchApp(ApplicationData data) {
  assert(data != null);
  WidgetsFlutterBinding.ensureInitialized();
  _launchAppAsync(data);
}

Future<void> _launchAppAsync(ApplicationData data) async {
  await Firebase.initializeApp();
  _injectEnv(data.environment);
  await _initServices(data.services);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await findSystemLocale();
  runApp(MowgliApp());
}

Future<void> _initServices(ApplicationServicesProvider services) {
  return ApplicationServices.register(services);
}

void _injectEnv(ApplicationEnvironment environment) {
  GetIt.instance.registerSingleton<ApplicationEnvironment>(environment);
}

ApplicationEnvironment get env => GetIt.instance<ApplicationEnvironment>();

class ApplicationData {
  final ApplicationServicesProvider services;
  final ApplicationEnvironment environment;

  const ApplicationData({@required this.services, @required this.environment})
      : assert(services != null),
        assert(environment != null);
}
