import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/service/dressed_up_service.dart';

class AuthRemoteDataSource {
  final DressedUpService dressedUpService;

  AuthRemoteDataSource(this.dressedUpService);

  Future<User> login(String username, String password) async {
    final response = await dressedUpService.login(username, password);
    return User.fromJson(response);
  }
}