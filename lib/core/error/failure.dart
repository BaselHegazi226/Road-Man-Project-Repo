import 'package:dio/dio.dart';

abstract class Failure {
  final String? errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timeout. Please try again.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: 'Receive timeout. Please try again.',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'Bad Certificate. Unable to verify server.',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response?.statusCode,
          responseData: dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'Connection error. Please check your internet.',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'Unexpected error. Please try again.',
        );
      // دي أهم نقطة - تغطية أي حالة مش محسوبة
      default:
        return ServerFailure(
          errorMessage: 'Something went wrong. Please try again.',
        );
    }
  }

  factory ServerFailure.fromResponse({
    required int? statusCode,
    required dynamic responseData,
  }) {
    if (statusCode == null) {
      return const ServerFailure(errorMessage: 'Unknown server error.');
    }

    if (responseData is Map<String, dynamic> && responseData['error'] != null) {
      return ServerFailure(errorMessage: responseData['error'].toString());
    }

    switch (statusCode) {
      case 400:
        return const ServerFailure(
          errorMessage: 'Bad request. Please check your input.',
        );
      case 401:
        return const ServerFailure(errorMessage: 'Unauthorized. Please login.');
      case 403:
        return const ServerFailure(errorMessage: 'Forbidden. Access denied.');
      case 404:
        return const ServerFailure(errorMessage: 'Resource not found.');
      case 409:
        return const ServerFailure(
          errorMessage: 'Conflict. Duplicate resource.',
        );
      case 422:
        return const ServerFailure(
          errorMessage: 'Validation error. Check your data.',
        );
      case 500:
        return const ServerFailure(errorMessage: 'Internal server error.');
      case 503:
        return const ServerFailure(errorMessage: 'Service unavailable.');
      default:
        return ServerFailure(errorMessage: 'Error occurred: $statusCode');
    }
  }
}
