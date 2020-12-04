import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/session/user_session.dart';
import 'package:mowgli/data/storage/storage.dart';

class UserSessionImpl implements UserSession {
  static const String _keyIsConnected = 'connected';

  StorageBox _box;
  bool _isUserConnected;

  @override
  Future<void> init() async {
    _box = await ApplicationServices.storage.create('user');

    // Load the value immediately to allow a "non Future" access
    _isUserConnected = await _box.getBoolean(_keyIsConnected, false);
  }

  @override
  Future<void> setUserConnected(bool isConnected) {
    _isUserConnected = isConnected;
    return _box.saveBoolean(_keyIsConnected, true);
  }

  @override
  bool isUserConnected() => _isUserConnected;

  @override
  Future<void> disconnect() => _box.clear();
}
