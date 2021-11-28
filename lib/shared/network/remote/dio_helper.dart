import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://amlakalibaba.com/wp-json/ml/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio!.get(
      url,
    );
  }
}
