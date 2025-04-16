import 'package:equatable/equatable.dart';

//Классы для обработки ошибок

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}
