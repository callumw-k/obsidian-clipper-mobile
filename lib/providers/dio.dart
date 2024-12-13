import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AuthDioClient {
  final Dio client;
  final logger = Logger('DioClient');

  AuthDioClient() : client = Dio() {
    client.options = BaseOptions(
      baseUrl: 'https://cwk.sh/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  void setBearerToken(String token) {
    if (token.isNotEmpty) {
      client.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @factoryMethod
  static Future<AuthDioClient> create() async {
    final dioClient = AuthDioClient();
    final storage = SharedPreferencesAsync();
    final token = await storage.getString('bearer_token');
    if (token != null && token.isNotEmpty) {
      dioClient.setBearerToken(token);
    }
    return dioClient;
  }
}
