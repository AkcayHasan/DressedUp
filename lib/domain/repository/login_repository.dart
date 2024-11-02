import 'package:dressed_up/data/models/user.dart';

abstract class LoginRepository {
  Future<User> login(String userName, String password);
}