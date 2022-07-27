import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://makeup.p.rapidapi.com/',
            receiveDataWhenStatusError: true,
          headers: {
              'X-RapidAPI-Key':"6e879e723emshfcd82fb72eaa7cdp1c45bbjsn982963e4faf6",
              'X-RapidAPI-Host':"makeup.p.rapidapi.com",
          }
        )
    );
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response> getData({
    required String url,
  }) async
  {
    return await dio.get(url);
  }
}