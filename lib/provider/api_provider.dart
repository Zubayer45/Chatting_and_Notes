// // ignore_for_file: unnecessary_brace_in_string_interps

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:rsm_app/models/response_model.dart';

// import '../data/api_services/Repository/api_repo.dart';
// import '../data/api_services/responseApi/api_response.dart';
// import '../models/jwt_token_model.dart';

// class ApiDataProvider with ChangeNotifier {
//   final ApiRepo apiRepo;
//   ApiDataProvider(this.apiRepo);
//   JwtTokenInfo? _jwtTokenInfo;
//   JwtTokenInfo? get jwtTokenInfo => _jwtTokenInfo;
//    Future<ResponseModel> jwtCall(
//     BuildContext context,
//   ) async {
//     _jwtTokenInfo = null;
// //2023-08-20T11:23:48.8650779Z
// //2023-08-20T13:23:48.8650782Z
//     ApiResponse apiResponse = await apiRepo.jwt();
//     ResponseModel responseModel;
//     if (apiResponse.response != null && (apiResponse.response!.statusCode == 200 || apiResponse.response!.statusCode == 201)) {
//       _jwtTokenInfo = JwtTokenInfo.fromJson(apiResponse.response!.data);
// // 2023-08-20T10:58:17.7949517Z
//       apiRepo.saveToken(_jwtTokenInfo!.tokenstr);
//       log("${_jwtTokenInfo}");
//       //apiRepo.saveExpiryDate(jwtTokenInfo!.expirytime!);
//       responseModel = ResponseModel(true, '${apiResponse.response}');
      
//       debugPrint('success');
//       //showCustomSnackBar('Success', context, isError: false);
//     } else {
//       if (apiRepo.getUserToken() != null) {
//         responseModel = ResponseModel(true, '${apiResponse.response}');
//       } else {
//         responseModel = ResponseModel(false, '${apiResponse.error}');
//       }

//       debugPrint('failed');
//       //showCustomSnackBar('Success', context, isError: true);
//     }
//     //notifyListeners();
//     return responseModel;
//   }

// }