import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecase(this.loginRepository);

  Future<User> call(String userName, String password) {
    return loginRepository.login(userName, password);
  }
}