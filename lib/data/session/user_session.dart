abstract class UserSession {
  Future<void> init();
  bool isUserConnected();
  Future<void> setUserConnected(bool isConnected);
  Future<void> disconnect();
}
