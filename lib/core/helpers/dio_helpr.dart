// https://yrbsbxbmzjkyzrxxillg.supabase.co/rest/v1/products?apikey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlyYnNieGJtempreXpyeHhpbGxnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjM5MjYsImV4cCI6MjA0ODM5OTkyNn0.c2HlDfegiIC74qCef8hwrQUwvHsV680Bm5sYWa1qgSE


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://yrbsbxbmzjkyzrxxillg.supabase.co/rest/v1/",
        receiveDataWhenStatusError: true,
        // headers: {
        //   //  "Authorization": 'Bearer ',
        // }
        ));

    // customization
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(endPoint, queryParameters: queryParameters);
  }

  static Future<Response> amitPostData(
      {required String endPoint, required dynamic data}) async {
    return await dio!.post(endPoint, data: data);
  }
}