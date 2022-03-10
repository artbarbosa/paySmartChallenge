import 'package:dio/dio.dart';

import 'http_client_service.dart';

class DioHttpServiceImp implements IHttpService {
  final Dio _dio;

  DioHttpServiceImp(this._dio);

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
