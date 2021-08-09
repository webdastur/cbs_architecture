// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
import 'package:aliftech_task/data/config/const/api_const.dart';
import 'package:aliftech_task/data/utils/app_logger_util.dart';
// 📦 Package imports:
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
   Dio? _dio;
  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<HttpService>(HttpService());
    await getIt<HttpService>().create();
  }

  Future create() async {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // ignore: missing_return
  Future<Response?> post({ String? path,  Map<String, dynamic>? fields,  String? token, dynamic data}) async {
    try {
      var body;
      if (fields == null) {
        body = Map<String, dynamic>();
      } else {
        body = fields;
      }
      AppLoggerUtil.d("API: ${APIConst.API_URL + path!} $data");
      if (token == null) {
        return await _dio!.post(
          APIConst.API_URL + path,
          data: body,
        );
      } else {
        return await _dio!.post(
          APIConst.API_URL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Token $token"},
          ),
        );
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }

  Future<dynamic> get({ String? path,  String? url,  Map<String, dynamic>? parameters,  String? token}) async {
    try {
      if (url == null) {
        AppLoggerUtil.d("API: ${APIConst.API_URL + path!}\n Parameters: $parameters");
        if (parameters == null) {
          if (token == null) {
            return await _dio!.get(APIConst.API_URL + path);
          } else {
            return await _dio!.get(
              APIConst.API_URL + path,
              options: Options(
                headers: {"Authorization": "Token $token"},
              ),
            );
          }
        }
        return await _dio!.get(APIConst.API_URL + path, queryParameters: parameters);
      } else {
        AppLoggerUtil.d("API: $url\n Parameters: $parameters");
        if (parameters == null) return await _dio!.get(url);
        return await _dio!.get(url, queryParameters: parameters);
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }
}
