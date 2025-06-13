


import 'package:dio/dio.dart';

class ApiException{

  final DioException exception;
  ApiException(this.exception);

  String get errorMessage{
    switch(exception.type) {
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';

      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout in connection with API server';

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        switch (statusCode) {
          case 400:
            return '${exception.response}';
          case 401:
            return
              exception.response?.data['message'] ??
                  'Unauthorized – Authentication is required and has failed or has not yet been provided.';
          case 403:
            return 'Forbidden – You do not have permission to access this resource.';
          case 404:
            return exception.response?.data['message'] ??'Not Found – The requested resource could not be found on the server.';
          case 405:
            return 'Method Not Allowed – The request method is known by the server but is not supported by the target resource.';
          case 413:
            return 'Payload Too Large – The request is larger than the server is willing or able to process.';
          case 415:
            return 'Unsupported Media Type – The media format of the requested data is not supported by the server.';
          case 429:
            return 'Too Many Requests – You have sent too many requests in a given amount of time.';
          case 500:
            return 'Internal Server Error – The server has encountered a situation it doesn’t know how to handle.';
          case 502:
            return 'Bad Gateway – The server received an invalid response from the upstream server.';
          case 503:
            return 'Service Unavailable – The server is not ready to handle the request, often due to maintenance.';
          case 504:
            return 'Gateway Timeout – The server did not receive a timely response from the upstream server.';
          default:
            return 'Unexpected error occurred. Status code: $statusCode';
        }



      case DioExceptionType.unknown:
        return 'Unexpected error occurred';

      case DioExceptionType.sendTimeout:
        return 'Send timeout in connection with API server';

      case DioExceptionType.badCertificate:
        return 'Error occurred while communication with API server';

      case DioExceptionType.connectionError:
        return 'please check your internet connection';
    }
  }


}




