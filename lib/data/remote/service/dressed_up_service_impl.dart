import 'package:dio/dio.dart';
import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/service/dressed_up_service.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';
import 'package:dressed_up/data/remote/service/safe_api_call.dart';

class DressedUpServiceImpl extends DressedUpService {
  final Dio dio;

  DressedUpServiceImpl(this.dio);

  @override
  Future<NetworkResult<void>> login(String userName, String password) async {
    return await safeApiCall(() async {
      return await dio.get("/path");
    }, null);
  }

  @override
  Future<NetworkResult<User>> register(String firstName, String userName, String password) async {
    return await safeApiCall(() async {
      return await dio.post("path");
    }, User.fromJson);
  }
}
