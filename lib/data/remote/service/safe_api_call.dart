import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dressed_up/data/remote/service/api_response.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';

Future<NetworkResult<T>> safeApiCall<T>(Future<Response<T>> Function() apiCall,
    [T Function(Map<String, dynamic>)? fromJson]) async {
  try {
    final response = await apiCall();
    if (response.statusCode == 200 && response.data != null) {
      try {
        final apiResponse = ApiResponse.fromJson(
          jsonDecode(response.data.toString()),
          (data) => data != null ? fromJson!(data as Map<String, dynamic>) : null
        );

        return Success(apiResponse.data as T);
      } catch (e) {
        return Error(e.toString());
      }
    } else {
      return Error(
        response.statusMessage ?? 'Unknown error',
        code: response.statusCode,
      );
    }
  } on DioException catch (dioError) {
    if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.receiveTimeout) {
      return const ExceptionResult(
        SocketException('Connection timed out'),
      );
    } else if (dioError.error is IOException) {
      return const ExceptionResult(
        SocketException('Network error occurred'),
      );
    } else {
      return Error(
        dioError.message.toString(),
        code: dioError.response?.statusCode,
      );
    }
  } catch (e) {
    return ExceptionResult(Exception(e.toString()));
  }
}
