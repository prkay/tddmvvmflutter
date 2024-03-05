import 'package:dartz/dartz.dart';

import '../error/failures.dart';

/// The usecase always contain the method process which has a type of hint to
/// its specific Request and Response interface.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(
    Params params,
  );
}
