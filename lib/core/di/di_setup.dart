import 'package:dressed_up/internal/navigation/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setup() {
  
  // Dio injection
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: "https://mockapi.io/")));

  getIt.registerSingleton<AppRouter>(AppRouter());
}