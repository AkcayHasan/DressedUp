import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/service/dressed_up_service.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';

class AuthRemoteDataSource {
  final DressedUpService dressedUpService;

  AuthRemoteDataSource(this.dressedUpService);

  Future<NetworkResult<void>> login(String username, String password) async {
    return await dressedUpService.login(username, password);
  }

  Future<NetworkResult<User>> register(String firstName, String username, String password) async {
    return await dressedUpService.register(firstName, username, password);
  }
}