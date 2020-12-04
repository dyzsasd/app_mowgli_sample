import 'package:package_info/package_info.dart';

class AppUtils {
  const AppUtils._();

  static Future<String> get appVersion async =>
      PackageInfo.fromPlatform().then((PackageInfo package) => package.version);

  static Future<String> get packageName async => PackageInfo.fromPlatform()
      .then((PackageInfo package) => package.packageName);
}
