import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
