import 'package:dio/dio.dart';
import 'package:transcript/app/core/utils/request_utils.dart';
import 'package:transcript/app/domain/interfaces/client_http.dart';

class DioClient implements IClientHTTP {
  final Dio _dio = Dio();

  @override
  Future get(RequestUtils requestUtils) async {
    try {
      final response = await _dio.get(
        requestUtils.path!,
        queryParameters: requestUtils.queryParameters,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(RequestUtils requestUtils) async {
    try {
      final response = await _dio.post(
        requestUtils.path!,
        data: requestUtils.data,
        queryParameters: requestUtils.queryParameters,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(RequestUtils requestUtils) async {
    try {
      final response = await _dio.put(
        requestUtils.path!,
        data: requestUtils.data,
        queryParameters: requestUtils.queryParameters,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(RequestUtils requestUtils) async {
    try {
      final response = await _dio.delete(
        requestUtils.path!,
        data: requestUtils.data,
        queryParameters: requestUtils.queryParameters,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
