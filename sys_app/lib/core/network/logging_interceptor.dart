import 'package:dio/dio.dart';

// Интерсептор для логирования запросов и ответов
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Логирование информации о запросе
    print('Request: ${options.method} ${options.path}');
    print('Request Headers: ${options.headers}');
    print('Request Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Логирование информации об ответе
    print('Response: ${response.statusCode} ${response.requestOptions.path}');
    print('Response Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Логирование информации об ошибках
    print('Error: ${err.response?.statusCode} ${err.requestOptions.path}');
    print('Error Message: ${err.message}');
    super.onError(err, handler);
  }
}
