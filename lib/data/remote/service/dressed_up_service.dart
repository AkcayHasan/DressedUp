import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';

abstract class DressedUpService {

  Future<NetworkResult<void>> login(String userName, String password);

  Future<NetworkResult<User>> register(String firstName, String userName, String password);
}