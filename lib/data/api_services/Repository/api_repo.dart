import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/app_constants.dart';

import '../Dio/dio_client.dart';
import '../exception/api_error_handler.dart';
import '../responseApi/api_response.dart';

class ApiRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  ApiRepo({required this.dioClient, required this.sharedPreferences});
  Future<ApiResponse> jwt() async {
    try {
      final response = await dioClient.post(
        AppConstants.jwtTokenUri,
        // data: {"UserId": "ADMIN", "Password": "12345", "Expirhour": 2},
        data: {"UserId": "user001", "Password": "12345678", "Expirhour": 8},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> dataApi({String? paramBaseString}) async {
    try {
      final response = await dioClient.post("dbAsyncRequest", data: '"$paramBaseString"');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveToken(String? token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveExpiryDate(String date) async {
    await sharedPreferences.setString('tokenExpiryDate', date);
  }

  String? getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN);
  }

  String? getTokenExpiryDate() {
    return sharedPreferences.getString('tokenExpiryDate');
  }

  Future<void> cleanBearerToken() async {
    await sharedPreferences.remove(AppConstants.TOKEN);
  }
}
