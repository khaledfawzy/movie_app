import 'package:dio/dio.dart';

abstract class Failure {
  // extends Equatable
  final String message;

  const Failure(this.message);

  // @override
  // List<Object> get props => [messege];
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('connectionError');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('url not found, try later');
    } else if (statusCode == 500) {
      return ServerFailure('Problem with server, try later');
    } else if (statusCode == 400 || statusCode == 403 ||statusCode == 401) {
      return ServerFailure(response['message']);
    } else {
      return ServerFailure('there was an error, try later');
    }
  }
}

class LocalFailure extends Failure {
  LocalFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
