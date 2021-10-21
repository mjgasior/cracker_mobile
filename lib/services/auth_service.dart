import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/constants.dart';
// import 'package:mjcoffee/models/auth0_id_token.dart';
// import 'package:mjcoffee/models/auth0_user.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  login() async {
    final authorizationTokenRequest = AuthorizationTokenRequest(
      auth0ClientId,
      auth0RedirectUri,
      issuer: auth0Issuer,
      scopes: ['openid', 'profile', 'offline_access', 'email'],
    );

    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      authorizationTokenRequest,
    );

    print(result);
  }
}
