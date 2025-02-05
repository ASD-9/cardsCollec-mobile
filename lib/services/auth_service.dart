// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/utils/error_handler.dart';

class AuthService {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthService(this._dio);

  Future<void> login({
    required String username,
    required String password
  }) async {
    try {
      final Response response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password
      });

      await _storage.write(key: 'accessToken', value: response.data["data"]["accessToken"]);
      await _storage.write(key: 'refreshToken', value: response.data["data"]["refreshToken"]);
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  Future<bool> refreshAccessToken() async {
    try {
      final String? refreshToken = await _storage.read(key: 'refreshToken');

      if (refreshToken == null) throw Exception();

      final Response response = await _dio.post('/auth/refresh-token', data: {
        'refreshToken': refreshToken
      });

      await _storage.write(key: 'accessToken', value: response.data["data"]["accessToken"]);
      return true;
    } catch (e) {
      await logout();
      return false;
    }
  }

  Future<void> logout() async {
    try {
      String? refreshToken = await _storage.read(key: 'refreshToken');
      await _dio.post("/auth/logout", data: {
        'refreshToken': refreshToken
      });
      await _storage.delete(key: 'accessToken');
      await _storage.delete(key: 'refreshToken');
      BuildContext? context = navigatorKey.currentContext;
      if (context == null) return;
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
