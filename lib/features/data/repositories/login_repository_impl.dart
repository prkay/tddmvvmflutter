import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_param.dart';
import '../datasource/login_datasource.dart';

/// Repository
class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, LoginEntity>> login(
    LoginParam params,
  ) async {
    try {
      var res = await dataSource.login(params);
      return Right(res);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
