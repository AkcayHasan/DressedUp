import 'package:dressed_up/data/remote/data_source/auth_remote_data_source.dart';
import 'package:dressed_up/data/remote/repository/login_repository_impl.dart';
import 'package:dressed_up/data/remote/service/dressed_up_service.dart';
import 'package:dressed_up/domain/repository/login_repository.dart';
import 'package:dressed_up/domain/use_cases/login_usecase.dart';
import 'package:dressed_up/internal/constants/dressed_up_constant.dart';
import 'package:dressed_up/internal/navigation/app_router.dart';
import 'package:dressed_up/presentation/screens/login/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setup() {
  
  // Dio injection
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: DressedUpConstant.baseUrl)));

  // Navigation
  getIt.registerSingleton<AppRouter>(AppRouter());

  // API Service
  getIt.registerLazySingleton<DressedUpService>(() => DressedUpService(getIt<Dio>()));

  // Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<DressedUpService>()),
  );

  // Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // Use Case
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(getIt<LoginRepository>()));

  // Store
  getIt.registerLazySingleton<LoginViewModel>(() => LoginViewModel(getIt<LoginUsecase>()));
}