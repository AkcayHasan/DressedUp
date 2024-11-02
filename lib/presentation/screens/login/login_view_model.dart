import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/domain/use_cases/login_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  final LoginUsecase loginUsecase;

  _LoginViewModel(this.loginUsecase);

  @observable
  User? user;

  @action
  Future<void> login(String userName, String password) async {
    try {
      await loginUsecase(userName, password);
    // ignore: empty_catches
    } catch (e) {
      
    }
  }
}