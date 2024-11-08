import 'package:dressed_up/data/remote/service/network_result.dart';

abstract class LoginRepository {
  Future<NetworkResult<void>> login(String userName, String password);
}