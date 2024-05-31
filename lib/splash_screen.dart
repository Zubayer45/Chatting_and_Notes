// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsm_app/provider/api_provider.dart';
import 'package:rsm_app/provider/hive_local_database/hive_local_storage.dart';
import 'package:rsm_app/provider/location/geolocation.dart';
import 'package:rsm_app/view/auth/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  getLocations() {
    //  var provider = Provider.of<GetLocation>(context, listen: false);
    //  provider.getGeolocation();
    //   log("${provider.placemark}");
    //  Provider.of<ApiDataProvider>(context,listen: false).jwtCall(context);
  }

  @override
  void initState() {
    getLocations();
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the main screen after the splash screen animation completes
        refreshLocalData();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      }
    });
  }

  refreshLocalData() async {
    Provider.of<HiveLocalStorage>(context, listen: false).refreshData();
  }

  @override
  Widget build(BuildContext context) {
    //   Provider.of<GetLocation>(context).getGeolocation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom animated logo
            // ScaleTransition(
            //   scale: _scaleAnimation,
            //   child: const FlutterLogo(size: 200),
            // ),
            const SizedBox(height: 20),
            // Custom text with animation
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'CHAT APP',
                style: TextStyle(
                  color: Color(0XFF32D1C6),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: const Color(0XFF32D1C6),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
