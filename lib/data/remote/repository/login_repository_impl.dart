import 'package:dressed_up/data/remote/data_source/auth_remote_data_source.dart';
import 'package:dressed_up/data/remote/service/network_result.dart';
import 'package:dressed_up/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthRemoteDataSource remoteDataSource;
  // localDataSource eklenebilir

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<NetworkResult<void>> login(String userName, String password) async {
    return await remoteDataSource.login(userName, password);
  }
}