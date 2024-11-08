import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';
import 'package:dressed_up/domain/use_cases/login_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

// ignore: library_private_types_in_public_api
class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  final LoginUsecase loginUsecase;

  _LoginViewModel(this.loginUsecase);

  @observable
  User? user;

  @action
  Future<NetworkResult<void>> login(String userName, String password) async {
    final result = loginUsecase.call(userName, password);

    switch (result) {
      case Success():
        return const Success<void>(null);
      case Error(:var code, :var message):
        return Error<void>(message, code: code);
      default:
       return const Error<void>('Unexpected error occurred');
    }
  }
}
