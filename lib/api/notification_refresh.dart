
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';



class Api {
  final Dio api = Dio();
  String? accessToken;

  final _storage = const FlutterSecureStorage();

  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = 'https://mtestsd.rbkei.in/api/StudentAnnouncements?LastUpdatedOn=2000-01-01' + options.path;
      }
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401 &&
          error.response?.data['message'] == "Invalid JWT")) {
        if (await _storage.containsKey(key: 'refreshToken')) {
          
        }
      }
      return handler.next(error);
    }));
  }


  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api
        .post('/auth/refresh', data: {'refreshToken': refreshToken});

    if (response.statusCode == 201) {
      accessToken = response.data;
      return true;
    } else {
      // refresh token is wrong
      accessToken = null;
      _storage.deleteAll();
      return false;
    }
  }
}