import '../../../../core/network/simple_client.dart';
import '../../../../core/remote_data_source_mixin.dart';
import '../../../core/network/network_constants.dart';
import '../../domain/usecases/login_param.dart';
import '../models/login_model.dart';

class LoginDataSource with RemoteDataSourceMixin {
  final SimpleClient _client;
  final NetworkConstants _networkConstants;
  LoginDataSource(this._client, this._networkConstants);

  Future<LoginModel> login(LoginParam params) async {
    return call<LoginModel>(() async {
      Uri url = Uri.parse(
        _networkConstants.baseUrl + _networkConstants.loginEndPoint,
      );

      dynamic response = await _client.post(
        url,
        headers: _networkConstants.getHeadersForLogin(),
        body: params.toMap(),
      );
      return LoginModel.fromJson(response);
    });
  }
}
