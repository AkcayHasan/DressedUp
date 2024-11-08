import 'package:dressed_up/data/remote/service/network_result.dart';
import 'package:dressed_up/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecase(this.loginRepository);

  Future<NetworkResult<void>> call(String userName, String password) {
    return loginRepository.login(userName, password);
  }
}