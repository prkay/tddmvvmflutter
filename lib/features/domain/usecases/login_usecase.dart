import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';
import 'login_param.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginParam> {
  final LoginRepository _repository;

  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, LoginEntity>> call(
    LoginParam params,
  ) async {
    var result = await _repository.login(
      params,
    );
    return result;
  }
}
