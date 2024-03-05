import 'error/exceptions.dart';
import 'utils/factory_function.dart';

mixin RemoteDataSourceMixin {
  Future<T> call<T>(FactoryFunction<Future<T>> factoryFunction) async {
    try {
      return await factoryFunction();
    } on HttpException {
      rethrow;
    } on DistilException catch (e) {
      throw DistilException(
        e.error,
      );
    } catch (err) {
      throw HttpException(
        errorMessage: '$err',
      );
    }
  }
}
