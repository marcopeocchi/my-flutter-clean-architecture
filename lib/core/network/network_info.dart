import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Future<bool> isHostnameReachable(String hostname);
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker checker;

  const NetworkInfoImpl(this.checker);

  @override
  Future<bool> get isConnected => checker.hasConnection;

  @override
  Future<bool> isHostnameReachable(String hostname) async {
    final check = await checker.isHostReachable(AddressCheckOptions(
      hostname: hostname,
    ));
    return check.isSuccess;
  }
}
