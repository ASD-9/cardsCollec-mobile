import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/services/auth_service.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env["API_BASE_URL"] ?? "",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  static Dio get dio => _dio;

  static void addInterceptors({
    required AuthService authService
  }) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? accessToken = await authService.getAccessToken();
          if (accessToken != null) {
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 && error.requestOptions.path != "/auth/refresh-token" && error.requestOptions.path != "/auth/login") {
            bool refreshSuccess = await authService.refreshAccessToken();
            if (refreshSuccess) {
              String? accessToken = await authService.getAccessToken();
              error.requestOptions.headers["Authorization"] = "Bearer $accessToken";
              try {
                final retryResponse = await _dio.fetch(error.requestOptions);
                return handler.resolve(retryResponse);
              } catch (e) {
                authService.logout();
              }
            }
          }
          return handler.next(error);
        },
      )
    );
  }
}
