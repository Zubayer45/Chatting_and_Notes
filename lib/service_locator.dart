// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:rsm_app/data/api_services/Dio/dio_client.dart';
// import 'package:rsm_app/data/api_services/Dio/logging_interceptor.dart';
// import 'package:rsm_app/provider/api_provider.dart';
// import 'package:rsm_app/provider/hive_local_database/hive_local_storage.dart';

// import 'package:rsm_app/provider/operation_provider.dart';
// import 'package:rsm_app/resources/app_constants.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'data/api_services/Repository/api_repo.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(),
//       loggingInterceptor: sl(), sharedPreferences: sl()));

//   //Repository
//   sl.registerLazySingleton(
//       () => ApiRepo(dioClient: sl(), sharedPreferences: sl()));

 

//   final sharedPreference = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreference);
//   sl.registerFactory(() => ApiDataProvider(sl()));
 
//   //sl.registerFactory(() => NotificationPrvoider());HiveLocalStorage GetLocation
//   sl.registerFactory(() => OperationProvider());
//   sl.registerFactory(() => HiveLocalStorage());
 
  
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => LoggingInterceptor());
// }
