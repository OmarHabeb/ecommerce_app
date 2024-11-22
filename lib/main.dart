import 'package:ecommerce_app/view/start/onboarding_screen.dart';
import 'package:ecommerce_app/view/start/onboardingtest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF1C2434),
          appBarTheme: AppBarTheme(
            color: Color(0xFF1C2434)
          ),
  
    
        iconTheme: IconThemeData(color: Colors.white),
    
      
          
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
