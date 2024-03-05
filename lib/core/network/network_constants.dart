class NetworkConstants {
  String get prodUrl => "https://dummyjson.com/";
  String get devUrl => "https://dummyjson.com/";
  String get baseUrl => devUrl;
  String get loginEndPoint => "auth/login";

  getHeadersForLogin() {
    return {'Content-Type': 'application/json'};
  }

  getHeaderWithBasicOauth() {
    return {
      "Accept": "application/json",
      "Authorization":
          "Basic c29jaWFsb3dsYXBwOkNvZ0dJRHFuOXpER0lLYU90QXI3V1BDZmlKQlR6Y0M2T1dFY1dxdjlNSWxwUWhFNXRI"
    };
  }

  getHeaderWithAccessToken(String accessToken) {
    return {
      "Accept": "application/json",
      "auth_token": accessToken,
      "Authorization":
          "Basic c29jaWFsb3dsYXBwOkNvZ0dJRHFuOXpER0lLYU90QXI3V1BDZmlKQlR6Y0M2T1dFY1dxdjlNSWxwUWhFNXRI"
    };
  }
}
