import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'api_helper.dart';
import 'http_method.dart';
import 'simple_request.dart';

// Everything that is not being used in this class just yet has been commented.
// Anyone who needs get, and/or cookies can simply uncomment the remaining code.
// Please be advised that the commented code has not been tested.

class SimpleClient {
  final Client client;
  String? baseUrl;
  final reqMethodDelete = 'DELETE';

  SimpleClient({this.baseUrl, httpClient}) : client = httpClient ?? Client();

  /// added method to close the http client
  ///  It's important to close each client when it's done being used; failing to do so can cause the Dart process to hang.
  void close() {
    client.close();
  }

  dynamic _getMethodCall(HTTPMethod method) {
    switch (method) {
      case HTTPMethod.post:
        return client.post;
      case HTTPMethod.delete:
        return client.delete;
      default:
        return client.get;
    }
  }

  Future<dynamic> get(Uri url, {required Map<String, String> headers}) {
    return _sendRequest(SimpleRequest(
      HTTPMethod.get,
      url,
      headers: headers,
    ));
  }

  Future<dynamic> post(Uri url,
      {dynamic body, required Map<String, String> headers}) {
    return _sendRequest(SimpleRequest(
      HTTPMethod.post,
      url,
      body: body,
      headers: headers,
    ));
  }

  Future<dynamic> delete(Uri url,
      {dynamic body, required Map<String, String> headers}) {
    var req = Request(reqMethodDelete, url);
    req.body = ApiHelper.toJson(body);
    req.headers.addAll(headers);
    return _sendHTTPBaseRequest(req);
  }

  Future _sendHTTPBaseRequest(Request request) {
    return _processStreamedResponse(client.send(request));
  }

  Future _sendRequest(SimpleRequest request) {
    dynamic methodClient = _getMethodCall(request.method);
    if (request.body == null) {
      return _processResponse(methodClient(
        request.url,
        headers: request.headers,
      ));
    } else {
      return _processResponse(methodClient(request.url,
          headers: request.headers, body: request.body));
    }
  }

  Future _processResponse(Future<Response>? response) {
    if (response == null) {
      throw const HttpException('There was some error in sending the request');
    }
    return response.catchError((err) {
      throw const HttpException('Error sending request');
    }).then((Response response) async {
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw HttpException(
            'Unexpected status code [$statusCode]: ${response.body}');
      }

      dynamic respBody = json.decode(response.body);

      return respBody;
    });
  }

  Future _processStreamedResponse(Future<StreamedResponse>? response) {
    if (response == null) {
      throw const HttpException('There was some error in sending the request');
    }
    return response.catchError((err) {
      throw const HttpException('Error sending request');
    }).then((StreamedResponse response) async {
      final statusCode = response.statusCode;
      final responseString = await response.stream.bytesToString();

      if (statusCode < 200 || statusCode >= 300) {
        throw HttpException(
            'Unexpected status code [$statusCode]: $responseString');
      }

      return responseString;
    });
  }
}
