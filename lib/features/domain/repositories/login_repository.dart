import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/login_entity.dart';
import '../usecases/login_param.dart';

/// Abstract repository for Login
abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(
    LoginParam params,
  );
}
