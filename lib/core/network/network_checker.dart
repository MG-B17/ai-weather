import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo{

  final InternetConnection internetConnection;

  NetworkInfoImpl({required this.internetConnection});
  @override
  Future<bool> isConnected()async {
   return await internetConnection.hasInternetAccess;
  }

}