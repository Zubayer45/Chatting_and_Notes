import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rsm_app/provider/api_provider.dart';
import 'package:rsm_app/provider/hive_local_database/hive_local_storage.dart';
import 'package:rsm_app/provider/internet_check/is_active.dart';
import 'package:rsm_app/provider/location/geolocation.dart';
import 'package:rsm_app/service_locator.dart' as di;
import 'package:rsm_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //এটি নিশ্চিত করে যে অ্যাপটি চালু হওয়ার আগে প্রয়োজনীয় সেটআপ করা হয়েছে।
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Hive.openBox('Notes');
  await Hive.openBox("");
  //di.init();
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider(create: (context) => ApiDataProvider()),
    ChangeNotifierProvider(create: (context) => HiveLocalStorage()),
    // ChangeNotifierProvider(create: (context) => di.sl<GetLocation>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0XFF32D1C6),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0XFF32D1C6),
            // secondary: const Color(0XFF32D1C6),
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
