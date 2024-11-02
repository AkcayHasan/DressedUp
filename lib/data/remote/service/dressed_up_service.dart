import 'package:dio/dio.dart';

class DressedUpService {
  final Dio dio;

  DressedUpService(this.dio);

  Future<Map<String, dynamic>> login(String userName, String password) async {
    if (userName == 'user' && password == 'password') {
      return {'username': userName, 'token': 'mock_token'};
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
