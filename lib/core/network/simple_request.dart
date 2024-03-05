import 'http_method.dart';

class SimpleRequest {
  final HTTPMethod method;
  final Uri url;
  final dynamic body;
  final Map<String, String> headers = <String, String>{};

  SimpleRequest(this.method, this.url,
      {this.body, Map<String, String>? headers}) {
    if (headers != null) {
      this.headers.addAll(headers);
    }
  }
}
