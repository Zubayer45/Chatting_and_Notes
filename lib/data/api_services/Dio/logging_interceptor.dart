import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoggingInterceptor extends InterceptorsWrapper {

  int maxCharactersPerLine = 200;

@override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  debugPrint("--> ${options.method} ${options.path}");
  debugPrint("Headers: ${options.headers.toString()}");
  debugPrint("<-- END HTTP");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint(response.data);
    }

    debugPrint("<-- END HTTP");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException  err, ErrorInterceptorHandler handler) {
    debugPrint("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}
