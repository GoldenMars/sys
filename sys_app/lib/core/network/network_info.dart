import 'package:internet_connection_checker/internet_connection_checker.dart';

// Абстрактный класс для проверки состояния сети
abstract class NetworkInfo {
  Future<bool> get isConnected; // Проверка наличия интернет-соединения
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection; // Реализация проверки соединения
}
