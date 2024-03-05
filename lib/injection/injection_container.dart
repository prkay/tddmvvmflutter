import 'package:get_it/get_it.dart';

import '../core/network/network_constants.dart';
import '../core/network/network_info.dart';
import '../core/network/simple_client.dart';
import '../features/data/datasource/login_datasource.dart';
import '../features/data/repositories/login_repository_impl.dart';
import '../features/domain/repositories/login_repository.dart';
import '../features/domain/usecases/login_usecase.dart';
import '../features/login/bloc/app_login_bloc.dart';
// Setting 'di' naming from dependency injection

final di = GetIt.instance;

Future<void> init() async {
  // BLoC
  di.registerFactory(
    () => AppLoginBloc(
      loginUseCase: di(),
    ),
  );
  // UseCase
  di.registerLazySingleton(
    () => LoginUseCase(
      di(),
    ),
  );

  // Repository
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      dataSource: di(),
    ),
  );

  // Datasource
  di.registerLazySingleton(
    () => LoginDataSource(
      di(),
      di(),
    ),
  );

  //! Common
  di.registerLazySingleton<NetworkConstants>(
    () => NetworkConstants(),
  );
  di.registerLazySingleton(
    () => SimpleClient(),
  );
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
}
