import 'package:dressed_up/data/models/user.dart';
import 'package:dressed_up/data/remote/data_source/auth_remote_data_source.dart';
import 'package:dressed_up/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String userName, String password) async {
    try {
      // Remote data source üzerinden kullanıcı girişini yap
      final user = await remoteDataSource.login(userName, password);
      // User modelini UserEntity'e dönüştür
      return User(user.username, user.email, user.password);
    } catch (e) {
      // Eğer hata olursa yeniden fırlat
      throw Exception('Failed to login: $e');
    }
  }
}